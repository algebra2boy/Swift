//
//  Gamestate.swift
//  TicTacToeSwiftUI
//
//  Created by Yongye Tan on 11/21/22.
//

import Foundation

class GameState: ObservableObject {
    // two Dimensional array
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross // X goes first always
    
    init(){
        resetBoard()
    }
    
    func resetBoard(){
        var newBoard = [[Cell]]()
        
        for _ in 0...2{
            
            var row = [Cell]()
            for _ in 0...2 {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
    
    func placeTitle(_ row:Int, _ column:Int) {
        
        // a symbol has been put, no need to change
        if (board[row][column].tile != Tile.Empty) {
            return
        }
        // short hand (if turn == Tile.Cross) {turn = Title.Cross} else {Tile.Circle}
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Circle
        // if turn == Tile.Circle {turn = Tile.Cross } else {Title.Circle}
        // at first it is Cross's turn, and now switch to Circle's turn (a cycle of Cross and Circle)
        turn = turn == Tile.Circle ? Tile.Cross : Tile.Circle
        
    
        
    }
}
