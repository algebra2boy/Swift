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
        
        Text(gameState.tileTurn())
            .bold()
            .font(.title)
            .padding()
        Spacer()
        
        Text(String(format: "Crosses: %d", gameState.CrossScore))
            .bold()
            .font(.title)
            .padding()
        
        // create a vertical stack
        VStack(spacing: CGFloat(10))
        {
            /// create three rows (is is 0,1,2)
            ForEach(0...2, id: \.self )
            {
                /// create horizontal stack for each of the row
                row in HStack(spacing: CGFloat(10)){
                    /// for each row, create three columns
                    ForEach(0...2, id: \.self )
                    {
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        // intially it is all ""
                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .bold()
                        // change the text color of the cell
                            .foregroundColor(cell.tileColor())
                        // fill up the whole screen first
                            .frame(maxWidth: .infinity,
                                   maxHeight: .infinity)
                        // reduce to good ratio and make it fit
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                        // put the X and O onto the grid if it is clicked (important)
                            .onTapGesture {
                                gameState.placeTitle(row, column)
                            }
                    }
                }
            }
        }
        // the line of lines
        .background(Color.black)
        // give it a little of edge
        .padding(10)
        // give it an alert when there is a winner or draw
        /// convert Bool to Binding<Bool> by placing the $ in front of gameState
        .alert(isPresented: $gameState.showAlertMessage) {
            Alert(title: Text(gameState.alertMessage),
                  /// .default creates a alert button
                dismissButton: .default(Text("OK")) {
                // reset the board right after the user clicks OK
                gameState.resetBoard()
            })
        }
        Text(String(format: "Circle: %d", gameState.CircleScore))
            .bold()
            .font(.title)
            .padding()
        Spacer()
    }
}

/// create the preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    } 
}
