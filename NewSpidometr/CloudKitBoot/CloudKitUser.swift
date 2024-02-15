//
//  CloudKitUser.swift
//  NewSpidometr
//
//  Created by Artem Kossov on 24.12.2023.
//

import SwiftUI
import CloudKit

class CloudKitUserBootcampViewModel: ObservableObject {
    
    @Published var permissionStatus: Bool = false
    @Published var isSigmedInToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    
    
   
   
    init() {
        getiCloudStatus()
        
        requestPermission()
     // fetchiCloudUserRecordID()
        
    }
    private func getiCloudStatus() {
        CKContainer.default().accountStatus { returnedStatus,arg  in
                switch returnedStatus {
                case .available:
                    self.isSigmedInToiCloud = true
                case .noAccount:
                    self.error = CloudKitError.iCloudAccountNotFound.rawValue
                case .couldNotDetermine:
                    
                    self.error = CloudKitError.iCloudAccountNotDetermined.rawValue
                case .restricted:
                    self.error = CloudKitError.iCloudAccountRestricted.rawValue
                default:
                    self.error = CloudKitError.iCloudAccountUnknown.rawValue
                }
            }
        }
    
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
    }
    
    func requestPermission() {
        CKContainer.default().fetchUserRecordID(completionHandler: { returnedStatus, returnedError in
            
                DispatchQueue.main.async {
                     
                        self.permissionStatus = true
                    }
                
            
        })
    }
   
    
    static func getUserInformation() async throws -> (String) {
        do {
            let recordID = try await CKContainer.default().userRecordID()
            let id = recordID.recordName
            
            let participant = try await CKContainer.default().shareParticipant(forUserRecordID: recordID)
            guard let nameComponents = participant.userIdentity.nameComponents else {
                throw CloudKitError.iCloudAccountNotFound
            }
            let name = PersonNameComponentsFormatter().string(from: nameComponents)
           
            return (name)
        } catch {
            throw error
        }
        
    }
    
    
    
    
   func displayUserInfo() {
    Task {
        do {
            let userInfo = try await CloudKitUserBootcampViewModel.getUserInformation()
            //id = userInfo.id
            userName = userInfo
        } catch {
            print("Ошибка получения информации о пользователе: \(error)")
        }
    }
}
}

//struct CloudKitUser: View {
//    
//    @State private var vm = CloudKitUserBootcampViewModel()
//    
//    @State private var id: String = ""
//    //@State private var userName: String = ""
//    
//    var body: some View {
//        
//      
//        
//        VStack {
//            Text("IS SINNED IN: \(vm.isSigmedInToiCloud.description.uppercased())")
//            Text(vm.error)
//            Text("Permission: \(vm.permissionStatus.description.uppercased())")
//            
//            Text("Name: \(vm.userName)")
//                }
//                .onAppear {
//                    vm.displayUserInfo()
//                }
//            }
//    
//    
    // функции используется асинхронная задача (Task), чтобы получить информацию о пользователе с помощью функции getUserInformation()
//    func displayUserInfo() {
//            Task {
//                do {
//                    let userInfo = try await CloudKitUserBootcampViewModel.getUserInformation()
//                    //id = userInfo.id
//                    userName = userInfo
//                } catch {
//                    print("Ошибка получения информации о пользователе: \(error)")
//                }
//            }
//        }
//}

//#Preview {
   // CloudKitUser()
//}

