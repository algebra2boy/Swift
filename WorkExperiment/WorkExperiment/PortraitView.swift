//
//  PortraitView.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 5/30/23.
//

import SwiftUI

struct PortraitView: View {
    @State var portrait: Image
    var body: some View {
        portrait
            .frame(width: 100, height: 100)
            .cornerRadius(10)
            .draggable(portrait)
//            .dropDestination(payloadType: Image.self) { (images: [Image], _) in
//                if let image = images.first {
//                    portrait = image
//                    return true
//                }
//                return false
//            }
    }
}
//
//struct PortraitView_Previews: PreviewProvider {
//    static var previews: some View {
//        PortraitView(Image(""))
//    }
//}
