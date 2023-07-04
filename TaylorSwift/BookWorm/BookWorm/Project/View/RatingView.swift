//
//  RatingView.swift
//  BookWorm
//
//  Created by Yongye Tan on 7/3/23.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    public var maximumRating = 5
    
    var body: some View {
        HStack {
            
            ForEach(1...maximumRating, id: \.self) { number in
                Image(systemName: "star.fill")
                    .foregroundStyle(number <= rating ? .yellow : .gray)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
 }

#Preview {
    RatingView(rating: .constant(4))
}
