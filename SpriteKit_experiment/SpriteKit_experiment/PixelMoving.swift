//
//  PixelMoving.swift
//  SpriteKit_experiment
//
//  Created by Yongye Tan on 4/23/24.
//

import SwiftUI
import SpriteKit

enum PlayerDirection: String {
    
    case up, down, left, right, stop
    
    var velocity: CGVector {
        switch self {
        case .up:
            return .init(dx: 0, dy: 100)
        case .down:
            return .init(dx: 0, dy: -100)
        case .left:
            return .init(dx: -100, dy: 0)
        case .right:
            return .init(dx: 100, dy: 0)
        case .stop:
            return .init(dx: 0, dy: 0)
        }
    }
    
}

class PixelMovingGameScene: SKScene {
    // Game code here
    
    // this is the green dot player
    var player = SKSpriteNode(color: .green, size: CGSize(width: 16, height: 16))
    
    // receive player's direction from the controller
    @Binding var currentDirection: PlayerDirection
    
    override func didMove(to view: SKView) {
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.affectedByGravity = false // this add gravity to the player
        player.position = .init(x: size.width / 2, y: size.height / 2) // make the player position in the middle
        player.physicsBody?.linearDamping = 0
        addChild(player) // must add this to add the player to the scene
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    init(_ direction: Binding<PlayerDirection>) {
        _currentDirection = direction
        super.init(size: CGSize(width: 414, height: 896))
        self.scaleMode = .fill
    }
    
    required init?(coder aDecoder: NSCoder) {
        _currentDirection = .constant(.up)
        super.init(coder: aDecoder)
    }
}

struct PixelMoving: View {
    
    @State private var currentDirection = PlayerDirection.up
    
    var scene: SKScene {
        let scene = PixelMovingGameScene($currentDirection)
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }
    
    
    var body: some View {
        
        // make background color to darkish
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray.opacity(0.8), Color.gray]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                SpriteView(scene: PixelMovingGameScene($currentDirection))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding(50)
                
                VStack(spacing: 10) {
                    HStack {
                        Spacer()
                        directionalButton(.up)
                        Spacer()
                    }
                    HStack {
                        directionalButton(.left)
                        directionalButton(.down)
                        directionalButton(.right)
                    }
                }
                .padding(.all, 10)
                
            }

        }
        
    }
    
    // the controller button
    func directionalButton(_ direction: PlayerDirection) -> some View {
        VStack {
            Button {
                self.currentDirection = direction
            } label: {
                Image(systemName: "arrow.\(direction.rawValue)")
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.black)
                    .background(Color.white.opacity(0.6))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}

#Preview {
    PixelMoving()
}
