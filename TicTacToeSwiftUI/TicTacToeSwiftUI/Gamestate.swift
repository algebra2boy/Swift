//
//  Gamestate.swift
//  TicTacToeSwiftUI
//
//  Created by Yongye Tan on 11/21/22.
//
import Foundation

class GameState: ObservableObject {
    // two Dimensional array contains Cell
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross // X goes first always
    @Published var CircleScore = 0
    @Published var CrossScore = 0
    @Published var showAlertMessage = false
    @Published var alertMessage = "DRAW"
    
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
        board[row][column].tile = (turn == Tile.Cross) ? Tile.Cross : Tile.Circle
        // check if there is a winner once a user places a title
        if (checkWhoWin()) {
            if (turn == Tile.Cross) {
                CrossScore += 1
            } else {
                CircleScore += 1
            }
            
            let winner = (turn == Tile.Cross) ? "Cross" : "Cricle"
            showAlertMessage = true
            alertMessage = winner + " Win!!"
            
        } else {
            // if turn == Tile.Circle {turn = Tile.Cross } else {Title.Circle}
            // at first it is Cross's turn, and now switch to Circle's turn (a cycle of Cross and Circle)
            /// keep switching turns if no winner yet
            turn = (turn == Tile.Circle) ? Tile.Cross : Tile.Circle
        }
    }
    
    func checkWhoWin() -> Bool{
        
        // verticle win
        if checkTitleMatch(0,0) && checkTitleMatch(1,0) && checkTitleMatch(2,0){
            return true
        }
        if checkTitleMatch(0,1) && checkTitleMatch(1,1) && checkTitleMatch(2,1){
            return true
        }
        if checkTitleMatch(0,2) && checkTitleMatch(1,2) && checkTitleMatch(2,2){
            return true
        }
        // horizontal win
        if checkTitleMatch(0,0) && checkTitleMatch(0,1) && checkTitleMatch(0,2){
            return true
        }
        if checkTitleMatch(1,0) && checkTitleMatch(1,1) && checkTitleMatch(1,2){
            return true
        }
        if checkTitleMatch(2,0) && checkTitleMatch(2,1) && checkTitleMatch(2,2){
            return true
        }
        
        // diagonal win
        if checkTitleMatch(0,0) && checkTitleMatch(1,1) && checkTitleMatch(2,2){
            return true
        }
        if checkTitleMatch(0,2) && checkTitleMatch(1,1) && checkTitleMatch(2,0){
            return true
        }
        
        return false
    }
    
    func checkTitleMatch(_ row:Int, _ column:Int) -> Bool {
        return board[row][column].tile == turn
    }
}
