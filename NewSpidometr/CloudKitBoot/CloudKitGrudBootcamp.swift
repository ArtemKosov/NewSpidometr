//
//  CloudKitGrudBootcamp.swift
//  CloudKitt
//
//  Created by Artem Kossov on 27.12.2023.
//

//import SwiftUI
//import CloudKit
//class CloudKitGrudBootcampViewModel: ObservableObject {
//    @EnvironmentObject var locationManager: LocationManager
//    @Published var text: String = ""
//    @Published var records: [String] = []
//    
//    init() {
//        fetchItem()
//        //addSpeedRecord()
//    }
//    
//    
//    func addButtonPrassed() {
//        guard !text.isEmpty else {return}
//        addItem(name: text)
//    }
//    
//    func addSpeedRecord() {
//        let speeds = locationManager.recordsSpeed
//        let distances = locationManager.distanceSpeed
//
//        // Вы можете сохранять каждую запись индивидуально или как массив, в зависимости от вашей модели данных в CloudKit
//        for (index, speed) in speeds.enumerated() {
//            let distance = distances[index]
//            // Создайте запись для CloudKit
//            let record = CKRecord(recordType: "SpeedRecord")
//            record["speed"] = speed
//            record["distance"] = distance
//            saveItem(record: record)
//        }
//    }
    
//   private func addItem(name: String) {
//       
//       
//        let newRecords = CKRecord(recordType: "Records")
//       newRecords["name"] = name
//       saveItem(record: newRecords)
//    }
//    
//    private func saveItem(record: CKRecord) {
//        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnRecord, returnedError in
//            print("Record: \(String(describing: returnRecord))")
//            print("Error: \(returnedError)")
//            
//            DispatchQueue.main.async {
//                self?.text = ""
//            }
//            
//        }
//    }
//    
//    
//    func fetchItem() {
//        
//        let predicate = NSPredicate(value: true)
//        let qere = CKQuery(recordType: "Records", predicate: predicate)
//        let queryOperation = CKQueryOperation(query: qere)
//        
//        var returnedItems: [String] = []
//        
//        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
//            switch returnedResult {
//            case .success(let record):
//                guard let name = record["name"] as? String else {return}
//                returnedItems.append(name)
//            case .failure(let error):
//                print("error \(error)")
//            }
//            
//            
//        }
//        
//        queryOperation.queryResultBlock = {[weak self]
//            returnedResult in
//            print("Returned Result: \(returnedResult)")
//            DispatchQueue.main.async {
//                self?.records = returnedItems
//            }
//           
//        }
//        
//        queryOperation.queryResultBlock = {[weak self]
//            (returnedCursor) in
//            print("Returned queryCompletionBlock")
//            DispatchQueue.main.async {
//                self?.records = returnedItems
//            }
//           
//        }
//        
//        addOperation(operation: queryOperation)
//    }
//    
//    func addOperation(operation: CKDatabaseOperation) {
//        CKContainer.default().publicCloudDatabase.add(operation)
//    }
//    
//    
//    
//    
//    
//}let sortedByFirstName = (returnedItems as NSArray).sortedArray(using: [NSSortDescriptor(key: "distan", ascending: false)])
//
//
//struct CloudKitGrudBootcamp: View {
//    @StateObject private var vm = CloudKitGrudBootcampViewModel()
//    @EnvironmentObject var locationManager: LocationManager // Используйте это свойство для доступа к locationManager
//
//   // @StateObject private var vm = CloudKitGrudBootcampViewModel()
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                header
//                textField
//                addButton
//                ContentView()
//                List {
//                    ForEach(vm.records, id: \.self) {
//                    Text($0)
//                    }
//                }
//                .listStyle(PlainListStyle())
//                //Text("Скорость масив \(vm.addSpeedRecord() )")
//            }
//            
//            .padding()
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//#Preview {
//    CloudKitGrudBootcamp()
//}
//extension CloudKitGrudBootcamp {
//    private var header: some View {
//        Text(" Cloud Kid Grid: ")
//            .font(.headline)
//    }
//    
//    private var textField: some View {
//        TextField("Add something here...", text: $vm.text)
//        //UIApplication.shared.endEditing()
//            .padding(.leading)
//            .frame(height: 50)
//            .background(Color.gray)
//            .opacity(0.4)
//            .cornerRadius(10)
//    }
//    private var addButton: some View {
//        Button(action: {
//            vm.addButtonPrassed()
//        }, label: {
//            Text("ADD")
//                .font(.headline)
//                .foregroundStyle(Color.white)
//                .frame(height: 50)
//                .frame(maxWidth: .infinity)
//                .background(Color.pink)
//                .cornerRadius(10)
//        })
//        
//    }
//    
//}
