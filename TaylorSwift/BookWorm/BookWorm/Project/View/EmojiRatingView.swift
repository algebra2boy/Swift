//
//  EmojiRatingView.swift
//  BookWorm
//
//  Created by Yongye Tan on 7/3/23.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            Image(systemName: "hand.thumbsdown")
        case 2:
            Image(systemName: "face.smiling")
        case 3:
            Image(systemName: "face.smiling")
        case 4:
            Image(systemName: "face.dashed")
        default:
            Image(systemName: "hand.thumbsup")
        }
    }
}

#Preview {
    EmojiRatingView(rating: Int16(5))
}
