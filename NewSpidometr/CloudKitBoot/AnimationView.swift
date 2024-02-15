//
//  AnimationView.swift
//  launch the iPhone
//
//  Created by Artem Kossov on 11.02.2024.
//

import SwiftUI

struct AnimationView: View {
    @State private var animation: Bool = false
    @State var rotation = 0.0
   // @State var spaceView: Bool = false
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack(spacing: 20) {
                    
                    HStack {
                        
                        NavigationLink("Hello, World", destination: SpaceView()
                            .navigationBarBackButtonHidden(true)
                        )
                            .opacity(animation ? 1 : 0)
                            //.navigationTitle("Home")
                          
                        Spacer()
                        Button("play") {
                            withAnimation(.easeInOut(duration: 1.5)) {
                                animation.toggle()
                                
                            }
                        }
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    
                    Text("CRUSH")
                    
                        .font(.system(size: 60))
                        .font(.headline)
                        .opacity(animation ? 1 : 0)
                        .foregroundColor(animation ? .red : .secondary)
                    
                        .animation(.easeInOut(duration: 1).delay(1), value: animation)
                    
                    
                    Spacer()
                    ZStack {
                        VStack(spacing: 0) {
                            ZStack {
                                
                                Image(systemName: "iphone.gen1")
                                    .font(.system(size: 15))
                                
                                    .frame(maxWidth: .infinity, alignment: animation ? .topLeading : .topTrailing)
                                    .padding(.horizontal)
                                    .opacity(animation ? 0 : 1)
                                
                                    .rotationEffect(.radians(animation ? -6.3 : 0))
                                
                                Image(systemName: "figure.mixed.cardio")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .opacity(animation ? 1 : 0)
                                    .padding(.horizontal, 25)
                                
                                
                                
                                Image(systemName: "figure.arms.open")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .opacity(animation ? 0.1 : 1)
                                    .padding(.horizontal, 25)
                                
                                
                            }
                            
                            VStack() {
                                Rectangle()
                                    .frame(maxHeight:.infinity)
                                    .frame(height: 1)
                                    .padding(.horizontal)
                                
                            }
                            
                            
                        }
                        
                        
                        Image(systemName: "fireworks")
                            .font(animation ? .title : .largeTitle)
                            .foregroundColor(Color.red)
                            .opacity(animation ? 0.8 : 0.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                            .padding()
                        
                            .animation(.easeInOut.delay(1.3), value: animation)
                        
                    }
                    
                    Text("Для тех кто хотел узнать с какой скоростью и накое расстояние полетит его телефон. 😀 Внимание для точных результатов необходимо выйти на улицу 🌤️")
                        .font(.footnote)
                        .opacity(animation ? 1 : 0)
                        .padding()
                    Spacer()
                    
                    
                }
            }
        }
        
        .environment(\.colorScheme, .dark)
    }
}


#Preview {
    AnimationView()
}
