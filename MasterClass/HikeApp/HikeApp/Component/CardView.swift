//
//  CardView.swift
//  HikeApp
//
//  Created by Yongye Tan on 7/10/23.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
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
                            isShowingSheet.toggle()
                        } label: {
                           CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                // a short little horizontal bar after being dragged
                                .presentationDragIndicator(.visible)
                                // how much we should show the sheet
                                // .medium detent - 50 %
                                // .large detent  - 100 %
                                .presentationDetents([.medium, .large])
                            
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
                        CustomCircleView()
                        
                        Image("image-\(imageNumber)")
                            .resizable()
                            .scaledToFit()
                            // add animation to image whenever imageNumebr is dynamically changed
                            .animation(.default, value: imageNumber)
                        
                    }
                    // MARK: - FOOTER
                
                    Button {
                        self.randomImage()
                    } label: {
                        Text("Explore More")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundStyle(
                                LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                            )
                            // add shadow to the background of text
                            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                    }
                    .buttonStyle(GradientButton())
                
                }
        } //: CARD
        .frame(width: 320, height: 580)
    }
    
    /// generate a random number
    func randomImage(){
        // repeat-while is very similar to do-while
        // prevent to get the same number as before
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
                    
        self.imageNumber  = randomNumber
    }
}

#Preview {
    CardView()
}
