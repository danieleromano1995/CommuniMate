//
//  GameScene.swift
//  EWW
//
//  Created by Jarvis on 13/12/21.
//

import SpriteKit
import GameplayKit

class DiscoverScene: SKScene {
    
    private var startLocation : CGPoint?
    private var pointLocation : CGPoint?

  
    override func didMove(to view: SKView) {}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.startLocation = t.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.pointLocation = t.location(in: self)
//            if(self.pointLocation!.y > (self.startLocation!.y + 50)){
//                let scene = SKScene(fileNamed: "GameScene")!
//                let transition = SKTransition.moveIn(with: .down, duration: 0.5)
//                self.view?.presentScene(scene, transition: transition)
//            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {}
}
