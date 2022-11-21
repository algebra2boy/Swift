//
//  ContentView.swift
//  TicTacToeSwiftUI
//
//  Created by Yongye Tan on 11/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameState = GameState()
    
    var body: some View
    {
        // create a vertical stack
        VStack(spacing: CGFloat(10))
        {
            /// create three rows
            ForEach(0...2, id: \.self )
            {
                /// create horizontal stack for each of the row
                row in HStack(spacing: CGFloat(10)){
                    /// for each row, create three columns
                    ForEach(0...2, id: \.self )
                    {
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .bold()
                            .foregroundColor(cell.tileColor())
                            // fill up the whole screen first
                            .frame(maxWidth: .infinity,
                                   maxHeight: .infinity)
                            // reduce to good ratio and make it fit
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            // put the X and O onto the grid if it is clicked
                            .onTapGesture {
                                gameState.placeTitle(row, column)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        // give it a little of edge
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
