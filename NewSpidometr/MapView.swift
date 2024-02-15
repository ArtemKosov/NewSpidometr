//
//  MapView.swift
//  launch the iPhone
//
//  Created by Artem Kossov on 27.11.2023.
//

import SwiftUI
import MapKit
struct MapView: View {
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        ZStack() {
            
            
            Map() {
                UserAnnotation()
                
            }
            
            .frame(width: 310, height: 310)
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 300, topTrailing: 0)))
            //.clipShape(Circle())
            .shadow(color: locationManager.log.hasPrefix("Доступ получен ☀️ 🌍") ? Color.green : Color.red,
                    radius: 20)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:  .bottomTrailing)
        .ignoresSafeArea()
        
        .mapControls {
            
            MapUserLocationButton()
        }
    }
}



#Preview {
    MapView()
}
