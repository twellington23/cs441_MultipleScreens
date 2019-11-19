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
    
    let gameBG = SKSpriteNode(imageNamed: "grey")
    let instructionsBG = SKSpriteNode(imageNamed: "grey")
    let bcircle = SKSpriteNode(imageNamed: "bcircle")
    let rcircle = SKSpriteNode(imageNamed: "rcircle")
    let info = SKSpriteNode(imageNamed: "info")
    let instructions = SKSpriteNode(imageNamed: "instructions")
    var isTapped = false
    
    override func didMove(to view: SKView) {
        gameBG.position = CGPoint(x: size.width * 0.2, y: size.width * 0.1)
        gameBG.zPosition = -1
        gameBG.name = "background"
        addChild(gameBG)
        
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
        
        //run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addButtons), SKAction.wait(forDuration: 2)])))
        addButtons()
    }
    
    @objc func showInfo(_ sender:UIButton!){
        isTapped = !isTapped
        instructionsBG.position = CGPoint(x: size.width * 0.2, y: size.width * 0.1)
        instructionsBG.zPosition = 3
        instructions.position = CGPoint(x: size.width * 0.015, y: size.width * 0.4)
        instructions.zPosition = 4
        if(isTapped){
            addChild(instructions)
            addChild(instructionsBG)
        } else {
            instructions.removeFromParent()
            instructionsBG.removeFromParent()
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
    
    func touchDown(atPoint pos : CGPoint) {}
    
    func touchMoved(toPoint pos : CGPoint) {}
    
    func touchUp(atPoint pos : CGPoint) {}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if bcircle.contains(touch.location(in: self)) {
            print("touched")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
