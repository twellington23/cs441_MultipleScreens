//
//  GameScene.swift
//  MultipleScreens
//
//  Created by Tyler Wellington on 10/14/19.
//  Copyright © 2019 Tyler Wellington. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var scoreLabel: SKLabelNode!

    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    let background1 = SKSpriteNode(imageNamed: "grey")
    let background2 = SKSpriteNode(imageNamed: "grey")
    let bcircle = SKSpriteNode(imageNamed: "bcircle")
    let rcircle = SKSpriteNode(imageNamed: "rcircle")
    let info = SKSpriteNode(imageNamed: "info")
    let instructions = SKSpriteNode(imageNamed: "instructions")
    var isTapped = false
    
    override func didMove(to view: SKView) {
        background1.position = CGPoint(x: size.width * 0.2, y: size.width * 0.1)
        background1.zPosition = -1
        background1.name = "background"
        addChild(background1)
        
        scoreLabel = SKLabelNode(fontNamed: "Courier")
        scoreLabel.fontColor = UIColor.black
        scoreLabel.text = "Score: 0"
        scoreLabel.position = CGPoint(x: size.width * 0.015, y: size.width * 0.75)
        scoreLabel.zPosition = 1
        addChild(scoreLabel)
        
        let button = UIButton(type: UIButton.ButtonType.system) as UIButton
        button.setTitle("Instructions", for: UIControl.State.normal)
        button.frame = CGRect(x: 125, y: 750, width: 125, height: 45)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(showInfo(_:)), for: .touchUpInside)
        self.view?.addSubview(button)
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addButtons), SKAction.wait(forDuration: 2)])))
    }
    
    @objc func showInfo(_ sender:UIButton!){
        isTapped = !isTapped
        background2.position = CGPoint(x: size.width * 0.2, y: size.width * 0.1)
        background2.zPosition = 3
        instructions.position = CGPoint(x: size.width * 0.015, y: size.width * 0.4)
        instructions.zPosition = 4
        if(isTapped){
            addChild(instructions)
            addChild(background2)
        } else {
            instructions.removeFromParent()
            background2.removeFromParent()
        }
    }
    
    func addButtons(){
        let p0 = CGPoint(x: size.width*0.0125, y: size.height*0.2)
        let p1 = CGPoint(x: size.width*0.0125, y: size.height*0.2*(-1))
        var point = Int(arc4random_uniform(100))
        
        if((bcircle.parent) != nil || (rcircle.parent) != nil){
            score = 0
            bcircle.removeFromParent()
            rcircle.removeFromParent()
        }
        
        if(point < 50){
            bcircle.position = p0
            bcircle.zPosition = 0
            bcircle.name = "bcirlce"
            addChild(bcircle)
            
            rcircle.position = p1
            rcircle.zPosition = 0
            rcircle.name = "rcircle"
            addChild(rcircle)
        } else {
            bcircle.position = p1
            bcircle.zPosition = 0
            bcircle.name = "bcirlce"
            addChild(bcircle)
            
            rcircle.position = p0
            rcircle.zPosition = 0
            rcircle.name = "rcircle"
            addChild(rcircle)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let touch:UITouch = touches.bcircle() as! UITouch
        //let positionInScene = touch.location(in: self)
        //_ = self.atPoint(positionInScene)
        
        //if let label = self.label {
        //    label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        //}
        
        //let touch:UITouch = touches.anyObject() as! UITouch
        //let positionInScene = touches.location(in: self)
        //let touchedNode = self.atPoint(positionInScene)
        /*
        info.position = CGPoint(x: size.width * 0.9, y: size.width * 0.4)
        info.zPosition = 10
        info.isUserInteractionEnabled = false
        let info = SKSpriteNode(imageNamed: "info")
        addChild(info)
        */
        //if info = self.info {
        //    info.run(SKAction(named: instructions))
        //}
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
