//
//  ListScene.swift
//  Ahmed Bekhit
//
//  Created by Ahmed Fathi on 4/18/15.
//  Copyright (c) 2015 Ahmed Fathi Bekhit. All rights reserved.
//

import SpriteKit
var thelabel = SKLabelNode()
var aboutbg = SKSpriteNode()
var aboutlbl = SKSpriteNode()
var edubg = SKSpriteNode()
var edulbl = SKSpriteNode()
var codingbg = SKSpriteNode()
var experiencelbl = SKSpriteNode()
var projectslbl = SKSpriteNode()
var scrollv : UIScrollView!
var node = SKNode()
var doit = 0
var showthe = 0
class ListScene: SKScene {
    override init(size: CGSize) {
        super.init(size :size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMoveToView(view: SKView) {
        doit = 0
        var pinch = UIPinchGestureRecognizer(target: self, action:"pinchit")
        self.view!.addGestureRecognizer(pinch)
        
        backgroundColor = SKColor(red:241.0/255.0, green:103.0/255.0, blue:103.0/255.0, alpha:1)
        /*scrollv = UIScrollView(frame: CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame), 590, 370))
        scrollv.contentSize = CGSizeMake(990, 370)
        scrollv.backgroundColor = SKColor.whiteColor()
        view.addSubview(scrollv)*/
        //START show tip
        thetip = SKLabelNode(fontNamed:"Avenir-Medium")
        thetip.text = "(Tap on any label to know more)"
        thetip.fontColor = SKColor.whiteColor()
        thetip.fontSize = 18
        thetip.alpha = 0;
        thetip.position = CGPointMake(self.frame.size.width-self.frame.size.width+140, self.frame.size.height-30)
        NSLog("%f",thetip.position.y)
        self.addChild(thetip)
        
        let showtip = SKAction.fadeAlphaTo(1.0, duration:1.8)
        thetip.runAction(showtip)
        //END show tip
        
        //START eye parts
        let eyeup = SKSpriteNode(imageNamed:"eyewhite.png")
        eyeup.xScale = 0.55
        eyeup.yScale = 0.55
        eyeup.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(eyeup)
        
        eyeblue = SKSpriteNode(imageNamed:"thefullblue.png")
        eyeblue.xScale = 0.103
        eyeblue.yScale = 0.103
        eyeblue.position = CGPointMake(CGRectGetMidX(self.frame)-5, CGRectGetMidY(self.frame))
        eyeblue.zPosition = 99
        self.addChild(eyeblue)
        //END eye parts
        
        //START blink frames
        let temp : SKTexture = blinkframes[1]
        blink = SKSpriteNode(texture: temp)
        blink.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        blink.xScale = 0.55
        blink.yScale = 0.55
        addChild(blink)
        blinkem()
        //END blink frames
        
        //START show info labels
        var labelnames = 0
        for var i=0; i<4; i++ {
            labelnames+=1
            thelabel = SKLabelNode(fontNamed:"Avenir-Medium")
            thelabel.fontColor = SKColor.whiteColor()
            if labelnames == 1 {
                thelabel.text = "About"
                thelabel.fontSize = 64
                thelabel.name = "aboutlbl"
                thelabel.position = CGPointMake(self.frame.size.width-self.frame.size.width-120, CGRectGetMidY(self.frame))
                self.addChild(thelabel)
                
                let two = SKAction.waitForDuration(0.4)
                let pushin = SKAction.moveToX(self.frame.size.width-self.frame.size.width+120, duration:0.3)
                let pushinre = SKAction.moveToX(self.frame.size.width-self.frame.size.width+140, duration:0.1)
                let pushall = SKAction.sequence([two,pushin,pushinre,pushin])
                thelabel.runAction(pushall)
                
            }else if labelnames == 2 {
                thelabel.text = "Education"
                thelabel.fontSize = 64
                thelabel.name = "edulbl"
                // replace -65 by +25
                thelabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height-self.frame.size.height-65)
                self.addChild(thelabel)
                
                let two = SKAction.waitForDuration(0.4)
                let pushin = SKAction.moveToY(self.frame.size.height-self.frame.size.height+25, duration:0.3)
                let pushinre = SKAction.moveToY(self.frame.size.height-self.frame.size.height+45, duration:0.1)
                let pushall = SKAction.sequence([two,pushin,pushinre,pushin])
                thelabel.runAction(pushall)
            }else if labelnames == 3 {
                thelabel.text = "Experience"
                thelabel.fontSize = 54
                thelabel.name = "experiencelbl"
                thelabel.position = CGPointMake(self.frame.size.width+250, CGRectGetMidY(self.frame))
                self.addChild(thelabel)
                
                let two = SKAction.waitForDuration(0.4)
                let pushin = SKAction.moveToX(self.frame.size.width-152, duration:0.3)
                let pushinre = SKAction.moveToX(self.frame.size.width-120, duration:0.1)
                let pushall = SKAction.sequence([two,pushin,pushinre,pushin])
                thelabel.runAction(pushall)
            }else if labelnames == 4 {
                thelabel.text = "Projects"
                thelabel.fontSize = 64
                thelabel.name = "projectslbl"

                thelabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height+50)
                self.addChild(thelabel)
                
                let two = SKAction.waitForDuration(0.4)
                let pushin = SKAction.moveToY(self.frame.size.height-90, duration:0.3)
                let pushinre = SKAction.moveToY(self.frame.size.height-110, duration:0.1)
                let pushall = SKAction.sequence([two,pushin,pushinre,pushin])
                thelabel.runAction(pushall)
            }
        }
        //END show info labels
        
        //START info schortcut
        aboutbg = SKSpriteNode(imageNamed:"mypic.png")
        aboutbg.xScale = 0.525
        aboutbg.yScale = 0.525
        aboutbg.alpha = 0
        aboutbg.zPosition = 99
        aboutbg.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(aboutbg)
        aboutlbl = SKSpriteNode(imageNamed:"aboutlbl.png")
        aboutlbl.xScale = 0.525
        aboutlbl.yScale = 0.525
        aboutlbl.alpha = 0
        aboutlbl.zPosition = 100
        aboutlbl.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(aboutlbl)
        
        edubg = SKSpriteNode(imageNamed:"mypicschool.png")
        edubg.xScale = 0.525
        edubg.yScale = 0.525
        edubg.alpha = 0
        edubg.zPosition = 99
        edubg.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(edubg)
        edulbl = SKSpriteNode(imageNamed:"edulbl.png")
        edulbl.xScale = 0.525
        edulbl.yScale = 0.525
        edulbl.alpha = 0
        edulbl.zPosition = 100
        edulbl.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(edulbl)
        
        codingbg = SKSpriteNode(imageNamed:"codingtweader.png")
        codingbg.xScale = 0.525
        codingbg.yScale = 0.525
        codingbg.alpha = 0
        codingbg.zPosition = 99
        codingbg.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(codingbg)
        experiencelbl = SKSpriteNode(imageNamed:"experiencelbl.png")
        experiencelbl.xScale = 0.525
        experiencelbl.yScale = 0.525
        experiencelbl.alpha = 0
        experiencelbl.zPosition = 100
        experiencelbl.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(experiencelbl)
        
        projectslbl = SKSpriteNode(imageNamed:"projectslbl.png")
        projectslbl.xScale = 0.525
        projectslbl.yScale = 0.525
        projectslbl.alpha = 0
        projectslbl.zPosition = 100
        projectslbl.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(projectslbl)
        //END info shortcut

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            let aboutlblp = self.nodeAtPoint(CGPointMake(self.frame.size.width-self.frame.size.width-120, CGRectGetMidY(self.frame)))

            node = self.nodeAtPoint(location)
            if node.name == "aboutlbl" {
                //About
                thetip.alpha = 0
                edulbl.alpha = 0
                edubg.alpha = 0
                codingbg.alpha = 0
                experiencelbl.alpha = 0
                projectslbl.alpha = 0
                eyeblue.alpha = 1
                eyeblue.zPosition = 0
                showthe = 1
                let moveeye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame)-35, CGRectGetMidY(self.frame)), duration: 0.2)
                let tosmallsize = SKAction.scaleTo(0.103, duration:0.2)
                eyeblue.runAction(SKAction.sequence([tosmallsize,moveeye]))
                runAction(SKAction.sequence([SKAction.waitForDuration(0.6),
                    SKAction.runBlock(){
                        let toeyesize = SKAction.scaleTo(0.52, duration:0.3)
                        let centereye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)), duration: 0.1)
                        eyeblue.alpha = 0.6
                        eyeblue.zPosition = 100
                        eyeblue.runAction(SKAction.sequence([toeyesize,centereye]))
                        aboutbg.runAction(SKAction.fadeAlphaTo(1.0, duration: 0.6))
                        aboutlbl.runAction(SKAction.fadeAlphaTo(1.0, duration: 0.6))
                        thetip.text = "(Pinch for more details)"
                        thetip.zPosition = 101
                        thetip.alpha = 1
                        thetip.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-140)
                        doit = 1
                    }]))
            }else if node.name == "edulbl" {
                //Education
                thetip.alpha = 0
                aboutbg.alpha = 0
                aboutlbl.alpha = 0
                codingbg.alpha = 0
                experiencelbl.alpha = 0
                projectslbl.alpha = 0
                eyeblue.alpha = 1
                eyeblue.zPosition = 0
                showthe = 2
                let moveeye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-32), duration: 0.2)
                let tosmallsize = SKAction.scaleTo(0.103, duration:0.2)
                eyeblue.runAction(SKAction.sequence([tosmallsize,moveeye]))
                runAction(SKAction.sequence([SKAction.waitForDuration(0.6),
                    SKAction.runBlock(){
                        let toeyesize = SKAction.scaleTo(0.52, duration:0.3)
                        let centereye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)), duration: 0.1)
                        eyeblue.alpha = 0.6
                        eyeblue.zPosition = 100
                        eyeblue.runAction(SKAction.sequence([toeyesize,centereye]))
                        edubg.runAction(SKAction.fadeAlphaTo(1.0, duration: 0.6))
                        edulbl.runAction(SKAction.fadeAlphaTo(1.0, duration: 0.6))
                        thetip.text = "(Pinch for more details)"
                        thetip.zPosition = 101
                        thetip.alpha = 1
                        thetip.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-140)
                        doit = 1
                    }]))
            }else if node.name == "experiencelbl" {
                //Experience
                thetip.alpha = 0
                edulbl.alpha = 0
                edubg.alpha = 0
                aboutbg.alpha = 0
                aboutlbl.alpha = 0
                codingbg.alpha = 0
                projectslbl.alpha = 0
                eyeblue.alpha = 1
                eyeblue.zPosition = 0
                showthe = 3
                let moveeye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame)+28, CGRectGetMidY(self.frame)), duration: 0.2)
                let tosmallsize = SKAction.scaleTo(0.103, duration:0.2)
                eyeblue.runAction(SKAction.sequence([tosmallsize,moveeye]))
                runAction(SKAction.sequence([SKAction.waitForDuration(0.6),
                    SKAction.runBlock(){
                        let toeyesize = SKAction.scaleTo(0.52, duration:0.3)
                        let centereye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)), duration: 0.1)
                        eyeblue.alpha = 0.6
                        eyeblue.zPosition = 100
                        eyeblue.runAction(SKAction.sequence([toeyesize,centereye]))
                        codingbg.runAction(SKAction.fadeAlphaTo(1.0, duration: 0.6))
                        experiencelbl.runAction(SKAction.fadeAlphaTo(1.0, duration: 0.6))
                        thetip.text = "(Pinch for more details)"
                        thetip.zPosition = 101
                        thetip.alpha = 1
                        thetip.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-140)
                        doit = 1
                    }]))
            }else if node.name == "projectslbl" {
                //Projects
                thetip.alpha = 0
                edulbl.alpha = 0
                edubg.alpha = 0
                aboutbg.alpha = 0
                codingbg.alpha = 0
                experiencelbl.alpha = 0
                aboutlbl.alpha = 0
                eyeblue.alpha = 1
                eyeblue.zPosition = 0
                showthe = 4
                let moveeye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+28), duration: 0.2)
                let tosmallsize = SKAction.scaleTo(0.103, duration:0.2)
                eyeblue.runAction(SKAction.sequence([tosmallsize,moveeye]))
                runAction(SKAction.sequence([SKAction.waitForDuration(0.6),
                    SKAction.runBlock(){
                        let toeyesize = SKAction.scaleTo(0.52, duration:0.3)
                        let centereye = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)), duration: 0.1)
                        eyeblue.alpha = 0.6
                        eyeblue.zPosition = 100
                        eyeblue.runAction(SKAction.sequence([toeyesize,centereye]))
                        codingbg.runAction(SKAction.fadeAlphaTo(1.0, duration: 0.6))
                        projectslbl.runAction(SKAction.fadeAlphaTo(1.0, duration: 0.6))
                        thetip.text = "(Pinch for more details)"
                        thetip.zPosition = 101
                        thetip.alpha = 1
                        thetip.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-140)
                        doit = 1
                    }]))
            }
        }
    }
    
    func pinchit(){
        NSLog("pinched")
        if doit == 1 {
            thetip.alpha = 0
            edulbl.alpha = 0
            edubg.alpha = 0
            aboutbg.alpha = 0
            codingbg.alpha = 0
            experiencelbl.alpha = 0
            aboutlbl.alpha = 0
            projectslbl.alpha = 0
            eyeblue.runAction(SKAction.scaleTo(100, duration: 15.6))
            eyeblue.runAction(SKAction.fadeAlphaTo(1.0, duration: 0.4))
            
            runAction(SKAction.sequence([SKAction.waitForDuration(0.6),
                SKAction.runBlock(){
                    let reveal = SKTransition.fadeWithDuration(0.4)
                    let godetails = DetailsScene(size:self.size)
                    self.view?.presentScene(godetails, transition:reveal)
                }
                ]))
            if let recognizers = view!.gestureRecognizers {
                for recognizer in recognizers {
                    view!.removeGestureRecognizer(recognizer as! UIPinchGestureRecognizer)
                }
            }
        }

    }
    
    func blinkem() {
        blink.runAction( SKAction.repeatActionForever(SKAction.animateWithTextures(blinkframes, timePerFrame:0.13, resize:false, restore:true)), withKey:"blinkallframes")
    }
}
