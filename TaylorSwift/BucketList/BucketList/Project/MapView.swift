//
//  MapView.swift
//  BucketList
//
//  Created by Yongye Tan on 7/16/23.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    // store a list of map location
    @State private var locations = [MapLocation]()
    
    @State private var selectedPlace: MapLocation?
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                                // customize the map marker with our visual
                        VStack {
                                Image(systemName: "star.circle")
                                        .resizable()
                                        .foregroundStyle(.red)
                                        .frame(width: 30, height: 30)
                                        .background(.white)
                                        .clipShape(Circle())
                                
                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            selectedPlace = location
                        }
                }
            }
            .ignoresSafeArea()
            
            
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        // because mapRegion is dynamically changed due to user's dragging, therefore center would be different each time
                        let newLocation = MapLocation(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        locations.append(newLocation)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundStyle(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .sheet(item: $selectedPlace) { place in
            EditMapView(location: place) { newLocation in
                // find the location where it is currently
                if let index = locations.firstIndex(of: place) {
                    locations[index] = newLocation
                }
            }
            
        }
    }
}


#Preview {
    MapView()
}
