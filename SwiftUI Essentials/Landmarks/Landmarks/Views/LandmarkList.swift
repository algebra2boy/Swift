//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Yongye Tan on 6/24/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    // the other view that we wish to direct to
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmark")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // try out different devices
        ForEach(["iPhone SE (3rd generation)", "iPhone 14"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }

    }
}
