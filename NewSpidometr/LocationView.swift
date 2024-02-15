//
//  LocationView.swift
//  NewSpidometr
//
//  Created by Artem Kossov on 09.12.2023.
//

import Foundation
import CoreLocation
import CloudKit

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var vvm = CloudKitUserBootcampViewModel()
    @Published var speedKmh: String = "0"
    @Published var distance: Double = 0
    @Published var recordsSpeed: [String] = []
    @Published var distanceSpeed: [Double] = []
    @Published var log: String = ""
   private var startTime: Date?
    @Published var previousLocation: CLLocation?
    private var speedsKmh: [Double] = []
    @Published var maxSpeedKmh: Double = 0 // Добавим переменную для максимальной скорости
    @Published var maxRecordDistants: Double = 0
    @Published var userName: String = ""
    @Published var warning: String = ""
    @Published var records: [(name: String, distan: Double, userName: String)] = []
    @Published var actionText: String = "👈 Нажми на кнопку"
    
    override init() {
        super.init()
      fetchItem()
       // variable.addSpeedRecord()
      // userName = vvm.userName
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        //locationManager.pausesLocationUpdatesAutomatically = true // убрал 07/ - чтобы включалось ресетом
       // locationManager.startUpdatingLocation() // убрал 07/ - чтобы включалось ресетом
    }
    
    
    func resetValues() {
     startTime = nil
        previousLocation = nil
        distance = 0
        speedsKmh = []
        speedKmh = "0"
        recordsSpeed = []
        distanceSpeed = []
        locationManager.startUpdatingLocation()
        maxSpeedKmh = 0
        maxRecordDistants = 0 
        actionText = "Можно кидать 🚀"
    }
    
    
    // начало CloudKit
    
    func saveMaxSpeedToCloudKit() {
        let maxSpeedString = String(format: "%.0f", maxSpeedKmh)
        
      //  let maxDistantsString = String(format:  "%.1f", maxRecordDistants / 3.6)
      
      // let maxDistantsString = Double(round(maxRecordDistants / 3.6 * 1000) / 1000)
    
        let maxDistantsString = Double(String(format: "%.2f", maxRecordDistants / 3.6))!
        
        let maxUserNameString = userName
        
        addItem(name: maxSpeedString, distan: maxDistantsString, userName: maxUserNameString)
        }

    
    private func addItem(name: String, distan: Double, userName: String) {
        
        
         let newRecords = CKRecord(recordType: "Records")
        newRecords["name"] = name
        newRecords["distan"] = distan
        newRecords["userName"] = userName
    
        
        saveItem(record: newRecords)
     }
    private func saveItem(record: CKRecord) {
        CKContainer.default().publicCloudDatabase.save(record) { returnRecord, returnedError in
            print("Record: \(String(describing: returnRecord))")
            print("Error: \(String(describing: returnedError))")
            
//            DispatchQueue.main.async {
//                self?.recordsSpeed = []
//            }
            
        }
    }
    
    
    
    
    func fetchItem() {
        
        let predicate = NSPredicate(value: true)
        let qere = CKQuery(recordType: "Records", predicate: predicate)
        qere.sortDescriptors = [NSSortDescriptor(key: "distan", ascending: false)]
                                                 //selector: #selector(NSString.localizedStandardCompare(_:)))]  // сортирует по дате создания!
        let queryOperation = CKQueryOperation(query: qere)
                                                 
        
        var returnedItems: [(name: String, distan: Double, userName: String)] = []
        

        
       // queryOperation.queryResultBlock = { [weak self] returnedResult in
            queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
                switch returnedResult {
                case .success(let record):
                    guard let name = record["name"] as? String else {return}
                    guard let distan = record["distan"] as? Double else
                    {return}
                   // record.recordType
                    guard let userName = record["userName"] as? String else {return}
                    returnedItems.append((name: name, distan: distan, userName: userName))
                    
                case .failure(let error):
                    print("error \(error)")
                }
                
            }
       // }
        
        queryOperation.queryResultBlock = {[weak self]
            returnedResult in
            print("Returned Result: \(returnedResult)")
            
            DispatchQueue.main.async {
                self?.records = returnedItems
//                self?.records = returnedItems.sorted{ (item1, item2) -> Bool in
//                    return item1.distan > item2.distan // сортируем
//                }
//                for item in returnedItems {               // хз
//                    self?.vvm.userName = item.userName
//                }
            }
           
        }
        
        
        addOperation(operation: queryOperation)
    }
    
    func addOperation(operation: CKDatabaseOperation) {
        CKContainer.default().publicCloudDatabase.add(operation)
    }
    
//    func requestLocation() {
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//        }
    
    func stopUpdatingLocation() {
    
        if distance >= 0 {
            locationManager.stopUpdatingLocation()
            actionText = "НЕ КИДАТЬ ❌"
        }
    
    }
    
    
    
}

                                                 
                                                 

// конец CloudKit




extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) { // перенес эту х ниже? что бы убрать manager: CLLocationManager
        switch manager.authorizationStatus {
        case .notDetermined,
                .restricted,
                .denied:
            log = "Необходим доступ 🫤"
            actionText = "НЕ КИДАТЬ ❌"
        case .authorizedAlways, .authorizedWhenInUse:
            log = "Доступ получен ☀️ 🌍"
            actionText = "👈 Нажми на кнопку"
        
        @unknown default:
            log = "Ошибка"
        }
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
       
        
        let locationManager = CLLocationManager()
        func viewDidLoad() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest  // добавил последним
        }
        
        
        
        if location.speed  >= 1 { //если ставим 0 то скидывается до нуля
            
            let sKmh: Double = location.speed * 3.6
            speedKmh = String(format: "%.0f", sKmh)
             recordsSpeed.append(speedKmh)
            
             userName = vvm.userName
            
                        if sKmh > maxSpeedKmh {                // новый код
                            maxSpeedKmh = sKmh
                            
//                            if sKmh > maxRecordDistants {
//                                maxRecordDistants = sKmh
//                            }
                            vvm.displayUserInfo()            //записывает имя в клоудкит
                            userName = vvm.userName
                        }
            
            
            if let previousLocation = previousLocation {
                distance += location.distance(from: previousLocation)
                let timeInterval = location.timestamp.timeIntervalSince(previousLocation.timestamp)
     
                if timeInterval != 0 { // добавил эту
                    
                    let speedKmh = 3.6 * distance / timeInterval
                    speedsKmh.append(speedKmh) // добавляет в масив
                    //  distanceSpeed.append(distance) // добавляет в масив
                    
                    if speedKmh > maxRecordDistants {                // новый код
                        maxRecordDistants = speedKmh
                    }
                }
            } //
       
            previousLocation = location
          
            
                    } else if location.speed  <= 0 || distance <= 0 {
            
                        if !speedsKmh.isEmpty { // Если уже были замеры скорости
            
                         stopUpdatingLocation()
                            
                            //locationManager.stopUpdatingLocation() // Остановить обновления локации
                            // Тут можно добавить любые дополнительные действия которые нужно сделать при остановке отслеживания
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                                self.saveMaxSpeedToCloudKit()
                            })
                            vvm.displayUserInfo()            //записывает имя в клоудкит
                            userName = vvm.userName
                            //saveMaxSpeedToCloudKit()
                            distance = 0
                            speedKmh = "0"
            
            
                        }
                        //stopUpdatingLocation()
                    }
        if startTime == nil { //последние добавление
            startTime = Date()
        }
            
        }
        
    }
//    func seiveView(locations: [CLLocation]) {
//        //
//        
//        
//        guard let location = locations.last else { return }
//        
//        
//        
//        
//        if location.speed >= 1 { //если ставим 0 то скидывается до нуля
//            
//            let sKmh: Double = location.speed * 3.6
//            speedKmh = String(format: "%.0f", sKmh)
//            // let sKmh = maxSpeedKmh
//            if sKmh > maxSpeedKmh {                // новый код
//                maxSpeedKmh = sKmh
//                if sKmh > maxRecordDistants {
//                    maxRecordDistants = sKmh
//                }
//                vvm.displayUserInfo()            //записывает имя в клоудкит
//                userName = vvm.userName
//                
//            } else if maxSpeedKmh <= 0 {
//                
//                //    locationManager.stopUpdatingLocation()
//                //            vvm.displayUserInfo()            //записывает имя в клоудкит
//                //           userName = vvm.userName
//                //locationManager.stopUpdatingLocation()
//                
//                
//                if !speedsKmh.isEmpty { // Если уже были замеры скорости
//                    
//                    stopUpdatingLocation()
//                    
//                    //locationManager.stopUpdatingLocation() // Остановить обновления локации
//                    // Тут можно добавить любые дополнительные действия которые нужно сделать при остановке отслеживания
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.03, execute: {
//                        self.saveMaxSpeedToCloudKit()
//                    })
//                    vvm.displayUserInfo()            //записывает имя в клоудкит
//                    userName = vvm.userName
//                    //saveMaxSpeedToCloudKit()
//                    distance = 0
//                    speedKmh = "0"
//                    
//                    
//                }
//                //stopUpdatingLocation()
//            }
//            
//        }
//        
//    }

