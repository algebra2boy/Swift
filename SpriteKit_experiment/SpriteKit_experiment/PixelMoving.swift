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

struct PhysicsCategory {
    static let none: UInt32 = 0
    static let player: UInt32 = 0b1 // 1
    static let apple: UInt32 = 0b10 // 2
}

class PixelMovingGameScene: SKScene, SKPhysicsContactDelegate {
    // Game code here
    
    // this is the green dot player
    var player = SKSpriteNode(color: .green, size: CGSize(width: 16, height: 16))
    
    // receive player's direction from the controller
    @Binding var currentDirection: PlayerDirection
    
    override func didMove(to view: SKView) {
        // sets the scene itself as the delegate to handle contact (collision) notifications.
        physicsWorld.contactDelegate = self
        self.view?.showsPhysics = true
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.affectedByGravity = false // this add gravity to the player
        player.position = .init(x: size.width / 2, y: size.height / 2) // make the player position in the middle
        player.physicsBody?.linearDamping = 0
        addChild(player) // must add this to add the player to the scene
        
        // attach mask to player node
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        player.physicsBody?.contactTestBitMask = PhysicsCategory.apple
        player.physicsBody?.collisionBitMask = PhysicsCategory.none
        
        spawnApple() // place the first apple
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        // one body is the player and the other is an apple
        if bodyA.categoryBitMask == PhysicsCategory.player && bodyB.categoryBitMask == PhysicsCategory.apple {
            bodyB.node?.removeFromParent() // remove apple from scene
            spawnApple()
            growPlayer()
        } else if bodyA.categoryBitMask == PhysicsCategory.apple && bodyB.categoryBitMask == PhysicsCategory.player {
            bodyA.node?.removeFromParent()
            spawnApple()
            growPlayer()
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // player is turning left but current direction is right
        if player.physicsBody?.velocity.dx ?? 0 < 0, currentDirection.velocity.dx > 0 {
            // can't turn
        // player to right, but current direction is left
        } else if player.physicsBody?.velocity.dx ?? 0 > 0, currentDirection.velocity.dx < 0 {
            // can't turn
        // player to down, but current direction is up
        } else if player.physicsBody?.velocity.dy ?? 0 < 0, currentDirection.velocity.dy > 0 {
            // can't turn
        // player to up, but current direction is down
        } else if player.physicsBody?.velocity.dy ?? 0 > 0, currentDirection.velocity.dy < 0 {
            // can't turn
        } else {
            player.physicsBody?.velocity = currentDirection.velocity
        }
        
        let playerHeightPadding = (player.size.height / 2) - 1
        let playerWidthPadding = (player.size.width / 2) - 1
        
        if player.position.x <= playerWidthPadding {
            player.position.x = player.size.width / 2
            currentDirection = .stop
        } else if player.position.x >= (self.size.width - playerWidthPadding) {
            player.position.x = self.size.width - (player.size.width / 2)
            currentDirection = .stop
        } else if player.position.y <= playerHeightPadding {
            player.position.y = player.size.height / 2
            currentDirection = .stop
        } else if player.position.y >= (self.size.height - playerHeightPadding) {
            player.position.y = self.size.height - (player.size.height / 2)
            currentDirection = .stop
        }
    }
    
    func spawnApple() {
        let apple = SKSpriteNode(color: .red, size: CGSize(width: 10, height: 10))
        apple.physicsBody = SKPhysicsBody(rectangleOf: apple.size)
        apple.physicsBody?.affectedByGravity = false
        apple.physicsBody?.isDynamic = false
        
        apple.physicsBody?.categoryBitMask = PhysicsCategory.apple
        apple.physicsBody?.contactTestBitMask = PhysicsCategory.player
        apple.physicsBody?.collisionBitMask = PhysicsCategory.none
        
        // Random position generate
        let x = CGFloat.random(in: (apple.size.width / 2)...(size.width - apple.size.width / 2))
        let y = CGFloat.random(in: (apple.size.height / 2)...(size.height - apple.size.height / 2))
        
        apple.position = CGPoint(x: x, y: y)
        
        addChild(apple)
        
    }
    
    func growPlayer() {
        let newSize = CGSize(width: player.size.width * 1.1, height: player.size.height * 1.1)
        player.size = newSize
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.linearDamping = 0
        
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        player.physicsBody?.contactTestBitMask = PhysicsCategory.apple
        player.physicsBody?.collisionBitMask = PhysicsCategory.none
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
