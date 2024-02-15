
//  ContentView.swift
//  NewSpidometr
//
//  Created by Artem Kossov on 09.12.2023.
//

import SwiftUI
import CoreLocation

//import CloudKit
struct ContentView: View {
   // @AppStorage("True") private var animationPlanets: Bool = false
    @State private var animationPlanets: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Circle()
                    .frame(width: 3)
                
                    
                NavigationLink(destination: SpaceView()
                    .navigationBarBackButtonHidden(true)
                               ,
                               label:  {
                    
                    
                    Circle()
                        .fill(
                            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9529411793, green: 0.8271918329, blue: 0.1333333403, alpha: 1)), Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), center: .center, startRadius: 30, endRadius: 100)
                            
                        )
                        .shadow(color: .red, radius: 20)
                        .shadow(color: .yellow, radius: 20)
                        //.shadow(color: .yellow, radius: 20)
                        .overlay {
                            VStack {
                                
//                               Text("START")
//                                    
//                                    .font(.caption)
//                                    .bold()
//                                    .foregroundColor(.black)
                            }
                        }
                        .frame(width: 140)
                        .frame(width: 300, height: 300, alignment: .topTrailing)
                        //.background(Color.white)
                    
                    
                    
                    
                })
                
                .opacity(animationPlanets ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(1), value: animationPlanets)
                
                HStack {
                    NavigationLink(destination: SpaceView()
                        .navigationBarBackButtonHidden(true)
                                   ,
                                   label:  {
                        
                        
                        Circle()
                            .fill(
                                RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), center: .center, startRadius: 30, endRadius: 100)
                                
                            )
                            .shadow(color: .blue, radius: 20)
                            .shadow(color: .blue, radius: 20)
                        
                            .overlay {
                                VStack {
                                    
                                    Text("Начать")
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: 100)
                            .frame(width: 150, height: 180, alignment: .bottomLeading)
                        
                        
                        
                        
                    })
                    
                    .opacity(animationPlanets ? 1 : 0)
                    .animation(.easeInOut(duration: 1).delay(1), value: animationPlanets)
                    
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: AnimationView()
                        .onAppear {
                            animationPlanets = true
                        }
                        .navigationBarBackButtonHidden(true),
                                   
                                   
                                   label: {
                        
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)),Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                                
                            )
                            .shadow(color:.white, radius: 10)
                        //  )
                        
                            .overlay {
                                HStack {
                                    Text("Инструкция")
                                        .foregroundColor(.primary)
                                    VStack {
                                        Circle()
                                     
                                            .fill(.shadow(.inner(color: Color.black, radius: 4, y: 0)))
                                        
                                        
                                            .frame(width: 40, alignment: .topLeading)
                                        
                                        // .background(Color.red)
                                    }
                                }
                            }
                        
                            .frame(width: 170)
                            .foregroundColor(.gray)
                        //                        .shadow(color:.white, radius: 10)
                        // .background(Color.red)
                        
                        
                    }
                    )
                    
                }
            }
            //.background(Color.blue)
            .padding(.horizontal, 30)
           // Text("TTT")
        }
       
                   
        .environment(\.colorScheme, .dark)
    }
    
}

#Preview {
    ContentView()
    
}
