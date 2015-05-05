//
//  GameScene.swift
//  Ahmed Bekhit
//
//  Created by Ahmed Fathi on 4/16/15.
//  Copyright (c) 2015 Ahmed Fathi Bekhit. All rights reserved.
//

import SpriteKit
import CoreMotion

var theX:CGFloat = 0.0
var eyeblue = SKSpriteNode()
var labels = SKLabelNode()
var pinch = UIPinchGestureRecognizer()
var shownext = 0
var eyelow = SKSpriteNode()
var blink : SKSpriteNode!
var blinkframes : [SKTexture]!
var thetip = SKLabelNode()
class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        
        let animatedblinkatlas = SKTextureAtlas(named:"blinks")
        var theblinkframes = [SKTexture]()
        
        for var i=1; i<=4; i++ {
            let blinktexture = "blink\(i)"
            theblinkframes.append(animatedblinkatlas.textureNamed(blinktexture))
        }
        
        blinkframes = theblinkframes
        

        //START show tip
        thetip = SKLabelNode(fontNamed:"Avenir-Medium")
        thetip.text = "(Tap anywhere on the screen)"
        thetip.fontColor = SKColor(red:168.0/255.0, green:168.0/255.0, blue:168.0/255.0, alpha: 1)
        thetip.fontSize = 18
        thetip.alpha = 0;
        thetip.position = CGPointMake(self.frame.size.width-self.frame.size.width+130, self.frame.size.height-30)
        NSLog("%f",thetip.position.y)
        self.addChild(thetip)
        
        let showtip = SKAction.fadeAlphaTo(1.0, duration:1.8)
        thetip.runAction(showtip)
        //END show tip
        
        //START eye parts
        var redname = 0
        for var i=0; i<2; i++ {
            redname+=1
            eyelow = SKSpriteNode(imageNamed:"eyered.png")
            if redname == 1 {
                let pulseout = SKAction.scaleTo(0.65, duration: 0.6)
                let pulsein = SKAction.scaleTo(0.6, duration: 0.3)
                let pulsall = SKAction.sequence([pulseout,pulsein])
                
                eyelow.xScale = 0.6
                eyelow.yScale = 0.6
                eyelow.alpha =  0.6
                eyelow.runAction(SKAction.repeatActionForever(pulsall))
            }else if redname == 2 {
                eyelow.xScale = 0.55
                eyelow.yScale = 0.55
            }
            
            eyelow.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
            self.addChild(eyelow)
        }
        
        let eyeup = SKSpriteNode(imageNamed:"eyewhite.png")
        eyeup.xScale = 0.55
        eyeup.yScale = 0.55
        eyeup.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(eyeup)
        
        eyeblue = SKSpriteNode(imageNamed:"thefullblue.png")
        eyeblue.xScale = 0.103
        eyeblue.yScale = 0.103
        eyeblue.position = CGPointMake(CGRectGetMidX(self.frame)-5, CGRectGetMidY(self.frame))
        self.addChild(eyeblue)
        //END eye parts
        
        //START eye look to Hello
        let moveeye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame)-35, CGRectGetMidY(self.frame)), duration: 0.2)
        eyeblue.runAction(moveeye)
        //END eye look to Hello

        //START welcome labels
        var labelname = 0
        for var o=0; o<6; o++ {
            labelname+=1
            labels = SKLabelNode(fontNamed:"Avenir-Medium")
            labels.fontColor = SKColor(red: 19.0/225.0, green: 170.0/225.0, blue: 222.0/225.0, alpha: 1)

            if labelname == 1 {
                
                labels.text = "Hello!"
                labels.fontSize = 68
                labels.name = "hello"
                // replace -100 by +100
                labels.position = CGPointMake(self.frame.size.width-self.frame.size.width-100, CGRectGetMidY(self.frame))
                self.addChild(labels)
                let two = SKAction.waitForDuration(0.5)
                let pushin = SKAction.moveToX(self.frame.size.width-self.frame.size.width+100, duration:0.3)
                let pushinre = SKAction.moveToX(self.frame.size.width-self.frame.size.width+120, duration:0.1)
                let pushall = SKAction.sequence([two,pushin,pushinre,pushin])
                labels.runAction(pushall)
                shownext = 1
            }else if labelname == 2 {
                labels.text = "I'm Ahmed"
                labels.fontSize = 68
                labels.name = "iam"
                // replace -65 by +25
                labels.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height-self.frame.size.height-65)
                self.addChild(labels)
            }else if labelname == 3 {
                labels.text = "iOS developer  " +
                              "                ."
                labels.fontSize = 38
                labels.name = "since"
                // replace +250 by -32
                labels.position = CGPointMake(self.frame.size.width+250, CGRectGetMidY(self.frame)+30)
                self.addChild(labels)
            }else if labelname == 4 {
                labels.text = "since 2013  " +
                "                       ."
                labels.fontSize = 38
                labels.name = "sincee"
                // replace +250 by -32
                labels.position = CGPointMake(self.frame.size.width+250, CGRectGetMidY(self.frame)-25)
                self.addChild(labels)
            }else if labelname == 5 {
                labels.text = "Pinch the eye below"
                labels.fontSize = 38
                labels.name = "pinchit"
                // replace +90 by -50
                labels.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height+90)
                self.addChild(labels)
            }else if labelname == 6 {
                labels.text = "to know more about me"
                labels.fontSize = 38
                labels.name = "pinchit2"
                // replace +50 by -90
                labels.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height+50)
                self.addChild(labels)
            }
        }
        
        //END welcome labels
        
        let temp : SKTexture = blinkframes[1]
        blink = SKSpriteNode(texture: temp)
        blink.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        blink.xScale = 0.55
        blink.yScale = 0.55
        addChild(blink)
        
        blinkem()
        
    }
    
    func blinkem() {
        blink.runAction( SKAction.repeatActionForever(SKAction.animateWithTextures(blinkframes, timePerFrame:0.13, resize:false, restore:true)), withKey:"blinkallframes")
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            //Hello!
            let hello = self.nodeAtPoint(CGPointMake(self.frame.size.width-self.frame.size.width+100, CGRectGetMidY(self.frame)))

            // I'm Ahmed
            let iamahmed = self.nodeAtPoint(CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height-self.frame.size.height-65))
            let iamahmedshown = self.nodeAtPoint(CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height-self.frame.size.height+25))

            //iOS developer since 2013
            let iosdev = self.nodeAtPoint(CGPointMake(self.frame.size.width+250, CGRectGetMidY(self.frame)+30))
            let iosdevshown = self.nodeAtPoint(CGPointMake(self.frame.size.width-32, CGRectGetMidY(self.frame)+30))

            // since 2013
            let since2013 = self.nodeAtPoint(CGPointMake(self.frame.size.width+250, CGRectGetMidY(self.frame)-25))
            let since2013shown = self.nodeAtPoint(CGPointMake(self.frame.size.width-32, CGRectGetMidY(self.frame)-25))

            //pinch to
            let pinchto = self.nodeAtPoint(CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height+90))

            //open
            let openpinch = self.nodeAtPoint(CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height+50))
            
            if shownext == 1 {
                shownext = 2
                let moveeye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-32), duration: 0.2)
                eyeblue.runAction(moveeye)
                
                let hideit = SKAction.moveToX(self.frame.size.width-self.frame.size.width-100, duration: 0.3)
                hello.runAction(hideit)
                let pushin = SKAction.moveToY(self.frame.size.height-self.frame.size.height+25, duration:0.3)
                let pushinre = SKAction.moveToY(self.frame.size.height-self.frame.size.height+45, duration:0.1)
                let pushall = SKAction.sequence([pushin,pushinre,pushin])
                iamahmed.runAction(pushall)
            }else if shownext == 2 {
                shownext = 3
                let moveeye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame)+28, CGRectGetMidY(self.frame)), duration: 0.2)
                eyeblue.runAction(moveeye)
                
                let hideit = SKAction.moveToY(self.frame.size.height-self.frame.size.height-65, duration: 0.3)
                iamahmedshown.runAction(hideit)
                
                let pushin = SKAction.moveToX(self.frame.size.width-32, duration:0.3)
                let pushinre = SKAction.moveToX(self.frame.size.width-52, duration:0.1)
                let pushall = SKAction.sequence([pushin,pushinre,pushin])
                iosdev.runAction(pushall)
                since2013.runAction(pushall)
                
            }else if shownext == 3 {
                shownext = 4
                let moveeye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+28), duration: 0.2)
                eyeblue.runAction(moveeye)
                
                let hideit = SKAction.moveToX(self.frame.size.width+250, duration: 0.3)
                since2013shown.runAction(hideit)
                iosdevshown.runAction(hideit)
                
                let pushin = SKAction.moveToY(self.frame.size.height-50, duration:0.3)
                let pushinre = SKAction.moveToY(self.frame.size.height-70, duration:0.1)
                let pushall = SKAction.sequence([pushin,pushinre,pushin])
                
                let pushinn = SKAction.moveToY(self.frame.size.height-90, duration:0.3)
                let pushinree = SKAction.moveToY(self.frame.size.height-110, duration:0.1)
                let pushalll = SKAction.sequence([pushinn,pushinree,pushinn])
                
                pinchto.runAction(pushall)
                openpinch.runAction(pushalll)

                var pinch = UIPinchGestureRecognizer(target: self, action:"pinchtheeye")
                self.view!.addGestureRecognizer(pinch)
            }

        }
    }
   
    func pinchtheeye() {
        if shownext == 4 {
        thetip.alpha = 0
        let labelpinch = self.nodeAtPoint(CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height-50))
        let lblpinch = self.nodeAtPoint(CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height-90))

        let hideit = SKAction.moveToY(self.frame.size.height+90, duration:0.3)
        let toall = SKAction.scaleTo(100, duration:15.8)
        eyeblue.position = CGPointMake(CGRectGetMidX(self.frame)-5, CGRectGetMidY(self.frame))
        lblpinch.runAction(hideit)
        labelpinch.runAction(hideit)
        eyelow.runAction(toall)
        shownext = 5
        runAction(SKAction.sequence([SKAction.waitForDuration(0.6),
            SKAction.runBlock(){
        let reveal = SKTransition.fadeWithDuration(0.2)
        let golist = ListScene(size:self.size)
        self.view?.presentScene(golist, transition:reveal)
            }
            ]))
        }
        if let recognizers = view!.gestureRecognizers {
            for recognizer in recognizers {
                view!.removeGestureRecognizer(recognizer as! UIPinchGestureRecognizer)
            }
        }
    }
    override func update(currentTime: CFTimeInterval) {
        var action = SKAction.moveToX(theX, duration:1)
       // eyeblue.runAction(action)
    }
}
