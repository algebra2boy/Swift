//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Yongye Tan on 6/24/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordination)
                .frame(height: 300)
                // make the map cover the top
                .ignoresSafeArea(edges: .top)
            
            // To layer the image view on top of the map view, give the image an offset of -130 points vertically, and padding of -130 points from the bottom of the view.

            CircleImage(image: landmark.image)
                // move circle to top
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack (alignment: .leading){
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    // pass it the reference of the enviornment object
                    // In FavoriteButton, the variale of the reference can be changed, which later can be reflected to the enviornemnt objected because both of them are shared
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    // A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
