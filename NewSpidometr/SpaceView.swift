//
//  SpaceView.swift
//  NewSpidometr
//
//  Created by Artem Kossov on 12.02.2024.
//

import SwiftUI
import CoreLocation

struct SpaceView: View {
    
    @State private var vm = CloudKitUserBootcampViewModel()
  //  @State private var cv = ContentView(animationPlanets: <#Bool#>t)
    @ObservedObject var locationManager = LocationManager()
    @State private var booton: Bool = false
    @State private var destenshen: PresentationDetent = .large
    @State private var buttonDisable: Bool = false
    @State private var buttonCaunt: Int = 0
    @State private var notificationText: String = "Осталось три попытки 😀"
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                
                VStack {
                    // Spacer()
                    VStack(alignment: .leading) {
                        
                        Text("Name: \(vm.userName)")
                        
                        // Spacer()
                        Text("Геопозиция: \(locationManager.log) ")
                        
                        
                        //   Text("\(locationManager.warning)")
                    }
                    
                    .padding(15)
                    .frame(width: 400, height: 100, alignment: .bottomLeading)
                    //   Spacer()
                    //.background(Color.red)
                    //.padding()
                    
                    
                    // Text("Положение: \(locationManager.log)")
                    HStack() {
                        Text("\(locationManager.speedKmh)")
                            .foregroundColor(Color.white)
                            .font(.system(size: 80, design: .rounded))
                        
                        Text("km/h")
                            .frame(width: 50, height: 50, alignment: .bottom)
                        
                        Spacer()
                        
                        Text("\(locationManager.distance, specifier: "%.1f")")
                            .foregroundColor(Color.white)
                            .font(.system(size: 80, design: .rounded))
                        Text("metre")
                            .frame(width: 50, height: 50, alignment: .bottom)
                    }
                    .frame(width: 350, height: 90)
                    //.background(.blue)
                    // .padding(20)
                    //Text("\(locationManager.distance, specifier: "%.2f")")
                    
                    
                    HStack(spacing: 50) { // масив скорость
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)),Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                                
                            )
                            .frame(height: 140)
                            .overlay(
                                Text("Растояние MAX \(locationManager.maxRecordDistants / 3.6, specifier: "%.1f")")  //"%.1f"
                                    .foregroundColor(.white)
                                    .font(.title2)
                                
                            )
                            .shadow(color: Color(#colorLiteral(red: 0.9795066962, green: 0.7823041738, blue: 0.3054257621, alpha: 1)), radius: 10)
                        // .padding()
                        // Circle()
                        
                        
                        //Spacer()
                        // .padding(25)
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)),Color(#colorLiteral(red: 0.9795066962, green: 0.7823041738, blue: 0.3054257621, alpha: 1))]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                            )
                            .frame(height: 140)
                        
                            .overlay(
                                
                                Text("Скорость MAX \(locationManager.maxSpeedKmh, specifier: "%.0f")")
                                    .foregroundColor(.white)
                                    .font(.title2)
                            )
                            .shadow(color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), radius: 10)
                    }
                    
                    .padding()
                    //.frame(maxWidth: .infinity)
                    // .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                    // Circle()
                    //                    Text("Скорость MAX \(locationManager.maxSpeedKmh, specifier: "%.0f")")
                    //                        .font(.title2)
                    
                    //Text("Name: \(mm.name)")
                    
                    // Text("Name: \(vm.userName)")
                    
                    //                    Button("Start") {
                    //
                    //                       // locationManager.seiveView()
                    //                    }
                    
                    
                    HStack() {
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)),Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                            )
                            .frame(height: 80)
                        
                        
                            .overlay(
                                VStack {
                                    
                                    Button("START") {
                                        
                                        butonStart()
                                        
//                                        if locationManager.log == "Необходим доступ 🫤" {
//                                            buttonDisable = false
//                                           //return
//
//                                        } else {
//                                            locationManager.resetValues()
//                                            buttonCaunt += 1
//                                            newText()
//                                            //buttonDisable = true
//
//                                        }
//                                        if  buttonCaunt >= 3 {
//                                            buttonDisable.toggle()
//                                           // return
                                       // }
                                        
                                    }
                                    // .foregroundColor(.white)
                                    .disabled(buttonDisable)
                                    //  .padding()
                                    .foregroundColor(buttonDisable ? Color.secondary: Color.white)
                                    //.foregroundColor(.white)
                                    
                                    .cornerRadius(10.0)
                                    // .padding()
                                    
                                    //)
                                    
                                    
                                    //                                    .padding(1)
                                    //                            Text("5")
                                    //                                .foregroundColor(Color.white)
                                    //
                                    
                                    
                                    
                                }
                                
                            )
                            .overlay(
                                
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 28, height: 28)
                                    .overlay(
                                    Text("\(buttonCaunt) / 3")
                                        .font(.system(size:10))
                                        .foregroundColor(Color.white)
                                       // .padding()
                                    )
                                    .shadow(color: .white, radius: 20)
                                ,alignment: .bottomTrailing
                                
                            )
                        //Spacer()
                        
                        .padding(.horizontal, 30)
                        Spacer()
                        VStack {
                           Text(locationManager.actionText)
                            Text(notificationText)
                        }
                        Spacer()
                    }
                  //  .background(Color.red)
                    .shadow(color: .clear, radius: 10, x: 5, y: 5)
                    .shadow(color: .white, radius: 20)
                    .padding()
                    
                    
                   // .frame(maxWidth: .infinity, alignment: .center)
//                    .overlay(
//
//                        Circle()
//                            .fill(Color.blue)
//                            .frame(width: 35, height: 35)
//                            .overlay(
//                            Text("\(buttonCaunt) / 3")
//                                .font(.system(size:11))
//                                .foregroundColor(Color.white)
//                               // .padding()
//                            )
//                            .shadow(color: .white, radius: 20)
//                        ,alignment: .bottomTrailing
//
//                    )
//
                  //  .background(Color.red)
                    
                    
                    HStack() {
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)),Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                            )
                            .frame(height: 110)
                            .overlay(
                                Button(action: {
                                    booton.toggle()
                                    
                                    
                                }, label: {
                                    Text("Tournament table")
                                    
                                        .foregroundStyle(Color.white)
                                    //.frame(height: 50)
                                    
                                    //.frame(maxWidth: .infinity)
                                    
                                    //.background(Color.blue)
                                    // .cornerRadius(10)
                                })
                            )
                    }
                    .shadow(color: .blue, radius: 20)
                    // .padding()
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    .sheet(isPresented: $booton, content: {
                        TournamentView()
                        
                            .presentationDetents([.medium, .large])
                    })
                    
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                    .padding(25)
                    Spacer(minLength: 150)
                    
                    
                    
                    
                }
               // .padding()
                // .background(Color.blue)
                
                VStack {
                    MapView()
                }
                
            }
            
            .onAppear {
                vm.displayUserInfo()
            }
            
        }
        
        .navigationBarItems(leading: 
                                NavigationLink(destination: ContentView()
                                    .navigationBarBackButtonHidden(true)
                                               
                                               ,
                                               
                                               
                                               label: {
            Image(systemName: "figure.walk.arrival")
                //.symbolEffect(.pulse)
                .foregroundColor(.white)
                //.font(10)
           // cv.animationPlanets.toggle()
        })
        )
        
        .environment(\.colorScheme, .dark)
        
    }
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
    func newText() {
        switch buttonCaunt {
        case 1:
            notificationText = "Оталось две попытки 😉"
        case 2:
            notificationText = "Оталось одна попытки 😐"
        case 3:
            notificationText = "Последняя попытка ☹️"
        
        
        default:
            notificationText = "eror"
        }
        
        
        
    }
    
    func butonStart() {
        if locationManager.log == "Необходим доступ 🫤" {
            buttonDisable = false
           //return
            
        } else {
            locationManager.resetValues()
            buttonCaunt += 1
            newText()
            //buttonDisable = true
           
        }
        if  buttonCaunt >= 3 {
            buttonDisable.toggle()
           // return
        }
        
    }
    
}
#Preview {
    SpaceView()
}
