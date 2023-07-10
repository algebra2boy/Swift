//
//  CardView.swift
//  HikeApp
//
//  Created by Yongye Tan on 7/10/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        // MARK: - CARD
        
        ZStack {
            CustomBackGroundView()
            
            VStack {
                VStack (alignment: .leading) {
                    // MARK: - HEADER
                    HStack {
                        Text("Hiking")
                            .font(.system(size: 50))
                            .fontWeight(.black)
                            .foregroundStyle(
                                LinearGradient(colors:
                                                [.customGrayLight, .customGrayMedium],
                                               startPoint: .top,
                                               endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            // Show a sheet 
                            print("The button was pressed")
                        } label: {
                           CustomButtonView()
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(Color.customGrayMedium)
                }
                .padding(.horizontal, 30)
                    
                    // MARK: - MAIN CONTENT
                    
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                colors: [
                                    Color("ColorIndigoMedium"),
                                    Color("ColorSalmonLight")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                            )
                            .frame(width: 250, height: 250)
                        
                        Image("image-1")
                            .resizable()
                            .scaledToFit()
                        
                        // MARK: - FOOTER
                    }
                }
        } //: CARD
        .frame(width: 320, height: 580)
    }
}

#Preview {
    CardView()
}
