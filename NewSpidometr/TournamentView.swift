//
//  TournamentView.swift
//  NewSpidometr
//
//  Created by Artem Kossov on 02.01.2024.
//

import SwiftUI

struct TournamentView: View {
    @ObservedObject var locationManager = LocationManager()
    var body: some View {
        
            NavigationView {
                VStack {
                    
                    List {
                        Section(
                            header:
                                HStack {
                                    Text("Winners ⭐️⭐️⭐️")
                                        .foregroundStyle(Color.primary)
                                        .font(.largeTitle)
                                }
                        ) {
                            ForEach(locationManager.records.indices.prefix(3), id: \.self) { index in
                                let speed = locationManager.records[index]
                                HStack {
                                   
                                        Text("\(index + 1). \(speed.userName)")
                                        Spacer()
                                        VStack {
                                            let maxDistantsString = Double(String(format: "%.2f", speed.distan))
                                            Text("Скорость: \(speed.name)")
                                            Text("Растояние: \(speed.distan.formatted(.number.precision(.fractionLength(2))))")
                                        }
                                    
                                        
                               
                            
                                    //.padding(.horizontal, 10)
                                }
                                
                            }
                            
                        }
                        Section(
                                            header: HStack {
                                                Text("Users 😉")
                                            }
                                                .foregroundStyle(Color.primary)
                                                .font(.largeTitle)
                                        ) {
                                            ForEach(locationManager.records.indices.dropFirst(3), id: \.self) { index in
                                                let speed = locationManager.records[index]
                                                HStack {
                                                    Text("\(index + 1). \(speed.userName)")
                                                    Spacer()
                                                    VStack {
                                                        Text("Скорость: \(speed.name)")
                                                        Text("Растояние: \(speed.distan.formatted(.number.precision(.fractionLength(2))))")
                                                    }
                                                }
                                            }
                                        }
                                    }
                    }
                    .listStyle(.plain)
                   // .environment(\.colorScheme, .dark)
                    //.listStyle(PlainListStyle())
                    
                    
                    
                }
            .environment(\.colorScheme, .dark)
                .navigationTitle("TournamentView")
            }
            
        
      
       
    }
       


#Preview {
    TournamentView()
}
