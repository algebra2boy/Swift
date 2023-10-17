//
//  TapGesture.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 10/12/23.
//

import SwiftUI

struct TapGestureTesting: View {
    @State private var location: CGPoint = .zero
        
        var spatialTapGesture: some Gesture {
            SpatialTapGesture()
                .onEnded { event in
                    print(event.location)
                    self.location = event.location
                }
        }
        
        var body: some View {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(location.y > 100 ? (location.y > 150 ? Color.orange : Color.indigo) : Color.mint)
                .overlay(Text("DevTechie").font(.title))
                .frame(width:200, height: 200)
                .gesture(spatialTapGesture)
        }

}

#Preview {
    TapGestureTesting()
}
