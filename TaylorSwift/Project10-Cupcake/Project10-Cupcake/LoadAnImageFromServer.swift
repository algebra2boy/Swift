//
//  LoadAnImageFromServer.swift
//  Project10-Cupcake
//
//  Created by Yongye Tan on 4/27/23.
//

import SwiftUI

struct LoadAnImageFromServer: View {
    var body: some View {
        //        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
        //        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) {
        //            image in
        //
        //            image
        //                .resizable()
        //                .scaledToFit()
        //        } placeholder: {
        ////            Color.red
        //            // a fun view that shows the progress
        //            ProgressView()
        //        }
        //        .frame(width: 200, height: 200)
        
        // what if the url does not work
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct LoadAnImageFromServer_Previews: PreviewProvider {
    static var previews: some View {
        LoadAnImageFromServer()
    }
}
