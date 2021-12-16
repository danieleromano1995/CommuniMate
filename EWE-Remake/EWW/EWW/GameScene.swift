//
//  GameScene.swift
//  EWW
//
//  Created by Jarvis on 13/12/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var greenCircle : SKShapeNode?
    private var purpleCircle : SKShapeNode?
    private var yellowCircle : SKShapeNode?
    private var ideaCircle : SKShapeNode?
    private var startLocation : CGPoint?
    private var pointLocation : CGPoint?
    private var angleOfRotation : CGFloat?
    private var purpleActive = true
    private var purpleFinish = false
    private var yellowActive = false
    private var yellowFinish = false
    private var greenActive = false
    private var greenFinish = false
    private var whiteActive = false
    private var what : SKSpriteNode?
    private var wHere : SKSpriteNode?
    private var when : SKSpriteNode?
    private var rotate : SKSpriteNode?
    private var end : CGFloat?
    override func didMove(to view: SKView) {
        self.what = childNode(withName: "what") as? SKSpriteNode
        self.wHere = childNode(withName: "where") as? SKSpriteNode
        self.when = childNode(withName: "when") as? SKSpriteNode
        self.rotate = childNode(withName: "rotate") as? SKSpriteNode
    
        let body = SKPhysicsBody(circleOfRadius: 50)
        body.affectedByGravity = false
        body.allowsRotation = true
        body.isDynamic = true
        body.angularDamping = 1
        let circle = SKShapeNode(circleOfRadius: 50)
        circle.fillColor = SKColor.clear
        circle.strokeColor = SKColor(named: "myGreen")!
        circle.lineWidth = 20
        circle.lineCap = .round
        circle.zPosition = 0
        let circle2 = SKShapeNode(circleOfRadius: 50)
        circle2.fillColor = SKColor.clear
        circle2.strokeColor = SKColor(named: "myPurple")!
        circle2.lineWidth = 20
        circle2.lineCap = .round
        circle2.zPosition = 0
        let circle3 = SKShapeNode(circleOfRadius: 50)
        circle3.fillColor = SKColor.clear
        circle3.strokeColor = SKColor(named: "myYellow")!
        circle3.lineWidth = 20
        circle3.lineCap = .round
        circle3.zPosition = 0
        addChild(circle)
        addChild(circle2)
        addChild(circle3)
        self.end = CGFloat.pi * 0.75
        circle.path = self.circle(radius: 115, end: self.end!)
        circle2.path = self.circle(radius: 163, end: self.end!)
        circle3.path = self.circle(radius: 139, end: self.end!)
        self.greenCircle = circle
        self.purpleCircle = circle2
        self.yellowCircle = circle3
        let ideaCircle = SKShapeNode(circleOfRadius: 8)
        ideaCircle.fillColor = SKColor.white
        ideaCircle.position = CGPoint(x: 0, y: 163)
        addChild(ideaCircle)
        self.ideaCircle = ideaCircle
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.startLocation = t.location(in: self)
            if(whiteActive){
                let scene = SKScene(fileNamed: "DiscoverScene")!
                let transition = SKTransition.moveIn(with: .right, duration: 1)
                self.view?.presentScene(scene, transition: transition)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        for t in touches {
            self.pointLocation = t.location(in: self)
            let xStart = CGFloat(self.startLocation!.x)
            let yStart = CGFloat(self.startLocation!.y)
            let xPoint = CGFloat (self.pointLocation!.x)
            let yPoint = CGFloat (self.pointLocation!.y)
            let xProduct = xStart * xPoint
            let yProduct = yStart * yPoint
            let scalarProduct = xProduct + yProduct
            let moduleStart = (xStart * xStart + yStart * yStart).squareRoot()
            let modulePoint = (xPoint * xPoint + yPoint * yPoint).squareRoot()
            let moduleProduct = moduleStart * modulePoint
            let divide = scalarProduct / moduleProduct
            let radiant = acos(divide)
            self.startLocation!.x = xStart
            self.startLocation!.y = yStart
            self.angleOfRotation = radiant/20
            if(purpleActive){
                self.rotation(circle: self.purpleCircle, angleOfRotation: self.angleOfRotation, radius: 163, toggleFinish: &self.purpleFinish, ideaY: 139)
            }
            if(yellowActive){
                self.rotation(circle: self.yellowCircle, angleOfRotation: self.angleOfRotation, radius: 139, toggleFinish: &self.yellowFinish,ideaY: 115)
            }
            if(greenActive){
                self.rotation(circle: self.greenCircle, angleOfRotation: self.angleOfRotation, radius: 115, toggleFinish: &self.greenFinish, ideaY: 0)
            }
           
            print(self.greenCircle?.zRotation.toDegreesNormalized)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.angleOfRotation = 0
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
        if (purpleFinish){
            self.what!.run(SKAction.fadeOut(withDuration: 0.5))
            self.wHere!.run(SKAction.fadeIn(withDuration: 1))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.purpleActive = false
                self.yellowActive = true
                self.purpleFinish = false
            }
        }
        if (yellowFinish){
            self.wHere!.run(SKAction.fadeOut(withDuration: 0.5))
            self.when!.run(SKAction.fadeIn(withDuration: 1))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.yellowActive = false
                self.greenActive = true
                self.yellowFinish = false
            }
        }
        if (greenFinish){
            self.rotate!.run(SKAction.fadeOut(withDuration: 0.75))
            self.when!.run(SKAction.fadeOut(withDuration: 0.75))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.greenActive = false
                self.whiteActive = true
                self.greenFinish = false
            }
        }
        if(whiteActive){
            self.ideaCircle?.run(SKAction.scale(to: 2.5, duration: 0.75))
            let label = childNode(withName: "tapTo") as! SKSpriteNode
            label.position = CGPoint(x: frame.midX, y: -109)
            label.run(SKAction.fadeIn(withDuration: 1))
        }

    }
    func circle(radius: CGFloat, end: CGFloat) -> CGPath {
        let bezierPath = UIBezierPath()
        bezierPath.addArc(withCenter: CGPoint.zero, radius: radius, startAngle:CGFloat.pi/4, endAngle: end, clockwise: false)
        return bezierPath.cgPath
    }
    func rotation(circle: SKShapeNode?, angleOfRotation: CGFloat?, radius: CGFloat, toggleFinish: inout Bool, ideaY: CGFloat) {
        circle?.zRotation -= angleOfRotation ?? 0.0
        if (circle!.zRotation.toDegreesNormalized <= 324.0270670378895){
            self.end! += angleOfRotation ?? 0.0
            circle?.path = self.circle(radius: radius, end: self.end!)
            if(circle!.zRotation.toDegreesNormalized <= 61.33850018092117){
                circle?.removeFromParent()
                self.end = CGFloat.pi * 0.75
                self.ideaCircle?.run(SKAction.moveTo(y: ideaY, duration: 1))
                toggleFinish.toggle()
            }
        }
    }
}
extension CGFloat {
    var toDegreesNormalized : CGFloat{
        var deg = self * 180 / .pi
        return deg >= 0 ? deg : deg + 360
    }

}

