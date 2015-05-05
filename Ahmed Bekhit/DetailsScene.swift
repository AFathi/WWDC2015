//
//  DetailsScene.swift
//  Ahmed Bekhit
//
//  Created by Ahmed Fathi on 4/22/15.
//  Copyright (c) 2015 Ahmed Fathi Bekhit. All rights reserved.
//

import SpriteKit
import CoreMotion

var motion = CMMotionManager()
var aboutscroll:UIScrollView!
var eduview:UIView!
var expview:UIView!
var percentage:UIView!
var projectscroll:UIScrollView!
var allphotos:UIScrollView!
var percentsshow = 0
var allphotosshow = 0
var appscreenshots = UIImageView()
var appscreenshotss = UIImageView()
var timer = NSTimer()
var timerr = NSTimer()

var tname = 0
var twname = 0
class DetailsScene: SKScene {
    override func didMoveToView(view: SKView) {
        var doubletap = UITapGestureRecognizer(target: self, action:"doublet")
        doubletap.numberOfTapsRequired = 2
        self.view!.addGestureRecognizer(doubletap)
        
        backgroundColor = SKColor(red: 22.0/255.0, green: 143.0/255.0, blue: 185.0/255.0, alpha: 1)
        if showthe == 1 {
        aboutscroll = UIScrollView(frame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        aboutscroll.contentSize = CGSizeMake(self.frame.size.width*2, self.frame.size.height)
        aboutscroll.backgroundColor = SKColor.clearColor()
        aboutscroll.showsHorizontalScrollIndicator = false
        aboutscroll.pagingEnabled = true
        view.addSubview(aboutscroll)
        
        let piccenter = UIImageView(image: UIImage(named:"mypic.png"))
        piccenter.frame = CGRectMake(self.frame.size.width/4, self.frame.size.width/4-190, 550, 550)
        aboutscroll.addSubview(piccenter)
        
        let open = CABasicAnimation(keyPath:"transform.scale")
        open.fromValue = 0
        open.toValue = 1
        open.duration = 0.6
        piccenter.layer.addAnimation(open, forKey:nil)
        
        let damietta = UIImageView(image: UIImage(named:"damietta.png"))
        damietta.frame = CGRectMake(self.frame.size.width+22, self.frame.size.width/5, 960, 141)
        damietta.clipsToBounds = true
        damietta.layer.cornerRadius = 18
        aboutscroll.addSubview(damietta)
        
        let riyadh = UIImageView(image: UIImage(named:"riyadh.png"))
        riyadh.frame = CGRectMake(self.frame.size.width+22, self.frame.size.width/1.8, 960, 141)
        riyadh.clipsToBounds = true
        riyadh.layer.cornerRadius = 18
        aboutscroll.addSubview(riyadh)
        
        let myname = UILabel(frame: CGRectMake(self.frame.size.width/2-170, self.frame.size.width/2+110, 390, 90))
        myname.font = UIFont(name: "Avenir-Black", size: 40)
        myname.text = "Ahmed Fathi Bekhit"
        myname.textColor = SKColor.whiteColor()
        aboutscroll.addSubview(myname)
            
            let arrow = UILabel(frame: CGRectMake(self.frame.size.width/1.1, self.frame.size.width/2+170, 390, 90))
            arrow.font = UIFont(name: "Avenir-Black", size: 70)
            arrow.text = ">"
            arrow.textColor = SKColor.whiteColor()
            arrow.layer.shadowColor = SKColor.blackColor().CGColor
            arrow.layer.shadowOffset = CGSizeMake(0, 2)
            arrow.layer.shadowOpacity = 1
            arrow.layer.shadowRadius = 1.0
            arrow.clipsToBounds = false
            aboutscroll.addSubview(arrow)
            
            let doubletip = UILabel(frame: CGRectMake(2*self.frame.size.width/1.2, self.frame.size.width/2+180, 390, 90))
            doubletip.font = UIFont(name: "Avenir-Medium", size: 25)
            doubletip.text = "(Double tap to go back)"
            doubletip.textColor = SKColor.whiteColor()
            doubletip.layer.shadowColor = SKColor.blackColor().CGColor
            doubletip.layer.shadowOffset = CGSizeMake(0, 2)
            doubletip.layer.shadowOpacity = 1
            doubletip.layer.shadowRadius = 1.0
            doubletip.clipsToBounds = false
            aboutscroll.addSubview(doubletip)
        
        let fade = CABasicAnimation(keyPath:"opacity")
        fade.fromValue = 0
        fade.toValue = 1.0
        fade.duration = 1.2
        myname.layer.addAnimation(fade, forKey:nil)
            
        var lblnum = 0
        for var i=0; i<4; i++ {
            lblnum += 1
            
            let maplbls = UILabel()
            if lblnum == 1 {
                //myname.backgroundColor = SKColor.whiteColor()
                maplbls.frame = CGRectMake(self.frame.size.width+20, 0, self.frame.size.width, 190)
                maplbls.font = UIFont(name:"Avenir-Medium", size: 55)
                maplbls.text = "I was born in November 14th 1998\nin Damietta, Egypt"
                maplbls.numberOfLines = 2
                maplbls.textColor = SKColor.whiteColor()
                aboutscroll.addSubview(maplbls)
            }else if lblnum == 2 {
                maplbls.font = UIFont(name:"Avenir-Medium", size: 55)
                maplbls.text = "I'm living in Riyadh, Saudi Arabia"
                maplbls.frame = CGRectMake(self.frame.size.width+20, 420, self.frame.size.width, 190)
                maplbls.textColor = SKColor.whiteColor()
                aboutscroll.addSubview(maplbls)
            }
        }
        }else if showthe == 2 {
            
            let doubletip = UILabel(frame: CGRectMake(self.frame.size.width/1.38, -10, 390, 90))
            doubletip.font = UIFont(name: "Avenir-Medium", size: 25)
            doubletip.text = "(Double tap to go back)"
            doubletip.textColor = SKColor.whiteColor()
            doubletip.layer.shadowColor = SKColor.blackColor().CGColor
            doubletip.layer.shadowOffset = CGSizeMake(0, 2)
            doubletip.layer.shadowOpacity = 1
            doubletip.layer.shadowRadius = 1.0
            doubletip.clipsToBounds = false
            
            eduview = UIView(frame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
            eduview.backgroundColor = SKColor.clearColor()
            view.addSubview(eduview)
            eduview.addSubview(doubletip)

            let picschool = UIImageView(image: UIImage(named:"mypicschool.png"))
            picschool.frame = CGRectMake(-20, -20, 400, 400)
            eduview.addSubview(picschool)
            
            let open = CABasicAnimation(keyPath:"transform.scale")
            open.fromValue = 0
            open.toValue = 1
            open.duration = 0.6
            picschool.layer.addAnimation(open, forKey:nil)
            
            let taboutlbl = UILabel(frame: CGRectMake(40, 0, self.frame.size.width, self.frame.size.height))
            taboutlbl.font = UIFont(name:"Avenir-Black", size: 45)
            taboutlbl.text = "\n                       I'm a 16 years old junior\n                        high school student in\n                       Al-Alson International School\n                     (Riyadh, Saudi Arabia)\n\nMy favorite subject in school is math, my\nmark in the last quarter's math test was\n25 out of 25!\nI'm taking my first SAT in May 2nd,\nI'm studying hard to get the score that would\nhelp me to get into Stanford!"
            taboutlbl.numberOfLines = 12
            taboutlbl.textColor = SKColor.whiteColor()
            eduview.addSubview(taboutlbl)
            
            let fade = CABasicAnimation(keyPath:"opacity")
            fade.fromValue = 0
            fade.toValue = 1.0
            fade.duration = 1.2
            taboutlbl.layer.addAnimation(fade, forKey:nil)
            
        }else if showthe == 3 {
            expview = UIView(frame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
            expview.backgroundColor = SKColor.clearColor()
            view.addSubview(expview)
            let doubletip = UILabel(frame: CGRectMake(self.frame.size.width/1.38, self.frame.size.width/2+180, 390, 90))
            doubletip.font = UIFont(name: "Avenir-Medium", size: 25)
            doubletip.text = "(Double tap to go back)"
            doubletip.textColor = SKColor.whiteColor()
            doubletip.layer.shadowColor = SKColor.blackColor().CGColor
            doubletip.layer.shadowOffset = CGSizeMake(0, 2)
            doubletip.layer.shadowOpacity = 1
            doubletip.layer.shadowRadius = 1.0
            doubletip.clipsToBounds = false
            expview.addSubview(doubletip)
            
            var infoint = 0
            for var i=0; i<3; i++ {
                infoint += 1
                let info = UIView()
                info.backgroundColor = SKColor.clearColor()
                expview.addSubview(info)
                
                
                let open = CABasicAnimation(keyPath:"transform.scale")
                open.fromValue = 0
                open.toValue = 1
                open.duration = 0.6
                info.layer.addAnimation(open, forKey:nil)
                
                let infobg = UIImageView()
                infobg.frame = CGRectMake(-2, 0, 500, 500)
                info.addSubview(infobg)
                
                let blackcircle = CALayer()
                blackcircle.backgroundColor = SKColor.blackColor().CGColor
                blackcircle.frame = CGRectMake(42, 48, 405, 405)
                blackcircle.cornerRadius = 200
                blackcircle.opacity = 0.6
                info.layer.addSublayer(blackcircle)
                
                let title = UILabel(frame: CGRectMake(95, 75, 290, 90))
                title.textAlignment = NSTextAlignment.Center
                title.textColor = SKColor.whiteColor()
                info.addSubview(title)
                
                let details = UILabel(frame: CGRectMake(68, 155, 350, 270))
                details.font = UIFont(name:"Avenir-Medium", size: 20)
                details.numberOfLines = 9
                details.textAlignment = NSTextAlignment.Center
                details.textColor = SKColor.whiteColor()
                info.addSubview(details)
                
                if infoint == 1 {
                    var onetap = UITapGestureRecognizer(target: self, action:"tapskill")
                    info.addGestureRecognizer(onetap)
                    info.frame = CGRectMake(-20, -6, 500, 500)
                    infobg.frame = CGRectMake(-2, -40, 500, 500)
                    blackcircle.frame = CGRectMake(42, 8, 405, 405)
                    title.frame = CGRectMake(95, 35, 290, 90)
                    details.frame = CGRectMake(68, 115, 350, 270)
                    infobg.image = UIImage(named:"codingtweader.png")
                    title.text = "Skills"
                    title.font = UIFont(name:"Avenir-Black", size: 45)
                    details.text = "The first programming language I used was C# and I created a simple calculator using it, then I learned HTML, PHP, and Javascript. I started iOS development in 2013 using Objective-C. When Swift was released last year I just played with it a bit in WWDC, this app is my first app written in Swift!"
                }else if infoint == 2 {
                    var onetap = UITapGestureRecognizer(target: self, action:"tapdubdub")
                    info.addGestureRecognizer(onetap)
                    info.frame = CGRectMake(540, 5, 500, 500)
                    infobg.frame = CGRectMake(-2, -40, 500, 500)
                    blackcircle.frame = CGRectMake(42, 8, 405, 405)
                    title.frame = CGRectMake(95, 35, 290, 90)
                    details.frame = CGRectMake(68, 115, 350, 270)
                    infobg.image = UIImage(named:"wwdc14.png")
                    title.text = "WWDC 2014"
                    title.font = UIFont(name:"Avenir-Black", size: 35)
                    details.text = "I was awarded a WWDC Student Scholarship last year. It was such a great experience to meet talented students and developers from the top tech companies in the world. I learned alot from Apple Engineers and Designers and had the chance to learn how to use latest technologies released last year!"
                }else if infoint == 3 {
                    var onetap = UITapGestureRecognizer(target: self, action:"taphack")
                    info.addGestureRecognizer(onetap)
                    info.frame = CGRectMake(235, 350, 500, 400)
                    infobg.frame = CGRectMake(-2, -40, 500, 500)
                    blackcircle.frame = CGRectMake(42, 8, 405, 405)
                    title.frame = CGRectMake(95, 35, 290, 90)
                    details.frame = CGRectMake(68, 115, 350, 270)
                    infobg.image = UIImage(named:"hack4diversity.png")
                    title.text = "Hack4Diversity"
                    title.font = UIFont(name:"Avenir-Black", size: 35)
                    details.text = "I participated in Hack4Diversity by CODE2040 last year when I was in San Francisco. I had a great experience working on an iPhone app with CODE2040 fellows and learning more about that great organization and what they do!"
                }
            }
        }else if showthe == 4 {
            NSLog("HERE'S MY PROJECTS")
            projectscroll = UIScrollView(frame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
            projectscroll.contentSize = CGSizeMake(self.frame.size.width*2, self.frame.size.height)
            projectscroll.backgroundColor = SKColor.clearColor()
            projectscroll.pagingEnabled = true
            projectscroll.showsHorizontalScrollIndicator = false
            view.addSubview(projectscroll)
            var tortw = 0
            for var i=0; i<2; i++ {
                tortw += 1
                let appname = UILabel()
                appname.font = UIFont(name:"Avenir-Black", size: 65)
                appname.textAlignment = NSTextAlignment.Center
                appname.textColor = SKColor.whiteColor()
                projectscroll.addSubview(appname)
                
                let appicon = UIImageView()
                projectscroll.addSubview(appicon)
                
                let appdetails = UILabel()
                appdetails.font = UIFont(name:"Avenir-Medium", size: 35)
                appdetails.numberOfLines = 2
                appdetails.textAlignment = NSTextAlignment.Center
                appdetails.textColor = SKColor.whiteColor()
                projectscroll.addSubview(appdetails)
                
                appscreenshots = UIImageView()
                appscreenshots.frame = CGRectMake(self.frame.size.width-440, 0, 440, 783)
                projectscroll.addSubview(appscreenshots)
                appscreenshotss = UIImageView()
                appscreenshotss.frame = CGRectMake(self.frame.size.width-440, 0, 440, 783)
                projectscroll.addSubview(appscreenshotss)
                if tortw == 1 {
                   /* let playtrickle = UIButton()
                    playtrickle.setTitle("Play now!", forState: .Normal)
                    playtrickle.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 35)
                    playtrickle.setTitleColor(UIColor(red: 27.0/255.0, green: 218.0/255.0, blue: 181.0/255.0, alpha: 1), forState: .Normal)
                    playtrickle.layer.shadowColor = SKColor.blackColor().CGColor
                    playtrickle.layer.shadowOffset = CGSizeMake(0, 2)
                    playtrickle.layer.shadowOpacity = 1
                    playtrickle.layer.shadowRadius = 1.0
                    playtrickle.clipsToBounds = false
                    playtrickle.frame = CGRectMake(appscreenshots.center.x-480, 150, 300, 500)
                    playtrickle.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
                    projectscroll.addSubview(playtrickle)*/
                    
                    appname.frame = CGRectMake(28, 5, self.frame.size.width/3, 190)
                    appname.text = "Trickle"
                    appicon.frame = CGRectMake(42, self.frame.size.height/3.5, 320, 320)
                    appicon.image = UIImage(named:"trickleicon.png")
                    appdetails.frame = CGRectMake(28, self.frame.size.height-190, self.frame.size.width/2.7, 190)
                    appdetails.text = "Trickle is a fun and addicting iPhone game"
                    appscreenshots.image = UIImage(named:"t1.png")
                    appscreenshots.frame = CGRectMake(self.frame.size.width-440, 0, 440, 783)
                }else if tortw == 2 {
                    appname.frame = CGRectMake(self.frame.size.width+28, 5, self.frame.size.width/3, 190)
                    appname.text = "Tweader"
                    appicon.frame = CGRectMake(self.frame.size.width+42, self.frame.size.height/3.5, 320, 320)
                    appicon.image = UIImage(named:"tweadericon.png")
                    appdetails.frame = CGRectMake(self.frame.size.width+28, self.frame.size.height-190, self.frame.size.width/2.7, 190)
                    appdetails.numberOfLines = 4
                    appdetails.text = "Tweader is an iPhone app that read tweets loudly with voice"
                    appscreenshotss.image = UIImage(named:"tw1.png")
                    appscreenshotss.frame = CGRectMake(self.frame.size.width*2-440, 0, 440, 783)

                }

            }
            timer = NSTimer.scheduledTimerWithTimeInterval(1.7, target: self, selector: "changet", userInfo: nil, repeats: true)
            timerr = NSTimer.scheduledTimerWithTimeInterval(1.7, target: self, selector: "changetw", userInfo: nil, repeats: true)
        }
    }
    
   /* func pressed(sender: UIButton!) {
        NSLog("Play tapped")
    }*/
    func changet() {
        if(tname == 5){
            tname = 0;
        }
        let fadescreenshot = CATransition()
        tname += 1;
        
        let tsname = NSString(format: "t%i.png",tname)
        appscreenshots.image = UIImage(named:tsname as String)
        
        fadescreenshot.duration = 1.2
        fadescreenshot.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        fadescreenshot.type = kCATransitionFade
        appscreenshots.layer.addAnimation(fadescreenshot, forKey: nil)
    }
    
    func changetw() {
        if(twname == 5){
            twname = 0;
        }
        let fadescreenshot = CATransition()
        twname += 1;
        
        let tsname = NSString(format: "tw%i.png",twname)
        appscreenshotss.image = UIImage(named:tsname as String)
        fadescreenshot.duration = 1.2
        fadescreenshot.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        fadescreenshot.type = kCATransitionFade
        appscreenshotss.layer.addAnimation(fadescreenshot, forKey: nil)
    }
    
    func goback() {
        runAction(SKAction.sequence([SKAction.waitForDuration(0.2),
            SKAction.runBlock(){
                expview.alpha = 1
                percentage.alpha = 0
            }]))
        let open = CABasicAnimation(keyPath:"transform.scale")
        open.fromValue = 0
        open.toValue = 1
        open.duration = 0.6
        expview.layer.addAnimation(open, forKey:nil)

    }
    
    func gobackk() {
        runAction(SKAction.sequence([SKAction.waitForDuration(0.2),
            SKAction.runBlock(){
                expview.alpha = 1
                allphotos.alpha = 0
            }]))
        let open = CABasicAnimation(keyPath:"transform.scale")
        open.fromValue = 0
        open.toValue = 1
        open.duration = 0.6
        expview.layer.addAnimation(open, forKey:nil)
        
    }
    
    func tapskill() {
        let close = CABasicAnimation(keyPath:"transform.scale")
        close.fromValue = 1
        close.toValue = 0
        close.duration = 0.6
        expview.layer.addAnimation(close, forKey:nil)
        runAction(SKAction.sequence([SKAction.waitForDuration(0.4),
            SKAction.runBlock(){
                expview.alpha = 0
                percentage = UIView(frame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
                percentage.backgroundColor = SKColor.clearColor()
                self.view!.addSubview(percentage)
                
                var barnum = 0
                for var i=0; i<4; i++ {
                    barnum += 1
                    
                    let title = UILabel(frame: CGRectMake(35, 20, self.frame.size.width-260, 80))
                    title.font = UIFont(name:"Avenir-Black", size: 50)
                    title.textColor = SKColor.whiteColor()
                    percentage.addSubview(title)
                    
                    let back = UILabel(frame: CGRectMake(self.frame.size.width-285, 0, self.frame.size.width-260, 80))
                    back.font = UIFont(name:"Avenir-Medium", size: 20)
                    back.textColor = SKColor.whiteColor()
                    back.layer.shadowColor = SKColor.blackColor().CGColor
                    back.layer.shadowOffset = CGSizeMake(0, 1)
                    back.layer.shadowOpacity = 1
                    back.layer.shadowRadius = 1.0
                    back.clipsToBounds = false
                    back.text = "(Tap anywhere to go back)"
                    percentage.addSubview(back)
                    var onetap = UITapGestureRecognizer(target: self, action:"goback")
                    percentage.addGestureRecognizer(onetap)
                    
                    let percents = UILabel(frame: CGRectMake(35, 108, self.frame.size.width-260, 80))
                    percents.font = UIFont(name:"Avenir-Medium", size: 50)
                    percents.textColor = SKColor.whiteColor()
                    percentage.addSubview(percents)
                    
                    let barbg = CALayer()
                    barbg.backgroundColor = SKColor(red: 22.0/255.0, green: 143.0/255.0, blue: 185.0/255.0, alpha: 1).CGColor
                    barbg.borderColor = SKColor.whiteColor().CGColor
                    barbg.borderWidth = 8
                    barbg.cornerRadius = 2
                    percentage.layer.addSublayer(barbg)
                    
                let bar = CALayer()
                bar.backgroundColor = SKColor.whiteColor().CGColor
                bar.cornerRadius = 2
                percentage.layer.addSublayer(bar)
                    
                let load = CABasicAnimation(keyPath:"transform.scale.x")
                load.fromValue = 0.1
                load.toValue = 0.9
                load.duration = 0.4
                bar.addAnimation(load, forKey:nil)
                    
                    if barnum == 1 {
                        title.frame = CGRectMake(35, 20, self.frame.size.width-260, 80)
                        title.text = "Objective-C"
                        percents.frame = CGRectMake(self.frame.size.width-200, 108, self.frame.size.width-260, 80)
                        percents.text = "90%"
                        barbg.frame = CGRectMake(35, 108, self.frame.size.width-260, 80)
                        bar.frame = CGRectMake(10, 108, barbg.frame.size.width, 80)
                        bar.frame = CGRectMake(35, 108, 0.9*barbg.frame.size.width, 80)

                    }else if barnum == 2 {
                        title.frame = CGRectMake(35, 200, self.frame.size.width-260, 80)
                        title.text = "PHP"
                        percents.frame = CGRectMake(self.frame.size.width-200, 278, self.frame.size.width-260, 80)
                        percents.text = "78%"
                        barbg.frame = CGRectMake(35, 278, self.frame.size.width-260, 80)
                        bar.frame = CGRectMake(10, 278, barbg.frame.size.width, 80)
                        bar.frame = CGRectMake(35, 278, 0.78*barbg.frame.size.width, 80)

                    }else if barnum == 3 {
                        title.frame = CGRectMake(35, 370, self.frame.size.width-260, 80)
                        title.text = "Javascript"
                        percents.frame = CGRectMake(self.frame.size.width-200, 448, self.frame.size.width-260, 80)
                        percents.text = "70%"
                        barbg.frame = CGRectMake(35, 448, self.frame.size.width-260, 80)
                        bar.frame = CGRectMake(10, 448, barbg.frame.size.width, 80)
                        bar.frame = CGRectMake(35, 448, 0.7*barbg.frame.size.width, 80)
                    }else if barnum == 4 {
                        title.frame = CGRectMake(35, 540, self.frame.size.width-260, 80)
                        title.text = "Swift"
                        percents.frame = CGRectMake(self.frame.size.width-200, 618, self.frame.size.width-260, 80)
                        percents.text = "60%"
                        barbg.frame = CGRectMake(35, 618, self.frame.size.width-260, 80)
                        bar.frame = CGRectMake(10, 618, barbg.frame.size.width, 80)
                        bar.frame = CGRectMake(35, 618, 0.6*barbg.frame.size.width, 80)
                    }
                }
                percentsshow = 1
            }]))
    }
    
    func tapdubdub() {
        let back = UILabel(frame: CGRectMake(self.frame.size.width-285, 0, self.frame.size.width-260, 80))
        back.font = UIFont(name: "Avenir-Medium", size: 20)
        back.text = "(Tap anywhere to go back)"
        back.textColor = SKColor.whiteColor()
        back.layer.shadowColor = SKColor.blackColor().CGColor
        back.layer.shadowOffset = CGSizeMake(0, 2)
        back.layer.shadowOpacity = 1
        back.layer.shadowRadius = 1.0
        back.clipsToBounds = false
        let close = CABasicAnimation(keyPath:"transform.scale")
        close.fromValue = 1
        close.toValue = 0
        close.duration = 0.6
        expview.layer.addAnimation(close, forKey:nil)
        runAction(SKAction.sequence([SKAction.waitForDuration(0.4),
            SKAction.runBlock(){
                expview.alpha = 0
        allphotos = UIScrollView(frame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        allphotos.contentSize = CGSizeMake(self.frame.size.width*2, self.frame.size.height)
        allphotos.backgroundColor = SKColor.clearColor()
        allphotos.pagingEnabled = true
        allphotos.showsHorizontalScrollIndicator = false
                var onetap = UITapGestureRecognizer(target: self, action:"gobackk")
                allphotos.addGestureRecognizer(onetap)

        self.view!.addSubview(allphotos)
                allphotos.addSubview(back)

                var photosnum = 0
                for var i=0; i<2; i++ {
                    photosnum += 1
                    let title = UILabel(frame: CGRectMake(35, 20, self.frame.size.width-260, 80))
                    title.font = UIFont(name:"Avenir-Black", size: 30)
                    title.textColor = SKColor.whiteColor()
                    title.textAlignment = NSTextAlignment.Center
                    title.numberOfLines = 2
                    if photosnum == 1 {

                        let thephoto = UIImageView(image: UIImage(named:"atwwdc.png"))
                        thephoto.frame = CGRectMake(0,0, self.frame.size.width, self.frame.size.height)
                        allphotos.addSubview(thephoto)
                        let blackrect = CALayer()
                        blackrect.backgroundColor = SKColor.blackColor().CGColor
                        blackrect.frame = CGRectMake(0, 660, self.frame.size.width, 120)
                        blackrect.opacity = 0.6
                        allphotos.layer.addSublayer(blackrect)
                        title.frame = CGRectMake(125, self.frame.size.height-170, self.frame.size.width-260, 240)
                        title.text = "^\nThat's me!"
                        title.layer.shadowColor = SKColor.blackColor().CGColor
                        title.layer.shadowOffset = CGSizeMake(0, 4)
                        title.layer.shadowOpacity = 1
                        title.layer.shadowRadius = 1.0
                        title.clipsToBounds = false
                        allphotos.addSubview(title)
                        
                    }else if photosnum == 2 {
                        let thephoto = UIImageView(image: UIImage(named:"onwsj.png"))
                        thephoto.frame = CGRectMake(self.frame.size.width,0, self.frame.size.width, self.frame.size.height)
                        allphotos.addSubview(thephoto)
                        let blackrect = CALayer()
                        blackrect.backgroundColor = SKColor.blackColor().CGColor
                        blackrect.frame = CGRectMake(self.frame.size.width, 660, self.frame.size.width, 120)
                        blackrect.opacity = 0.6
                        allphotos.layer.addSublayer(blackrect)
                        title.frame = CGRectMake(125+self.frame.size.width, self.frame.size.height-170, self.frame.size.width-260, 220)
                        title.text = "Thanks Apple, I was featured on\n The Wall Street Journal in August 2014!"
                        title.layer.shadowColor = SKColor.blackColor().CGColor
                        title.layer.shadowOffset = CGSizeMake(0, 4)
                        title.layer.shadowOpacity = 1
                        title.layer.shadowRadius = 1.0
                        title.clipsToBounds = false
                        allphotos.addSubview(title)
                    }
                    
                }
                allphotosshow = 1

        }]))
    }
    
    func taphack() {
        let close = CABasicAnimation(keyPath:"transform.scale")
        close.fromValue = 1
        close.toValue = 0
        close.duration = 0.6
        expview.layer.addAnimation(close, forKey:nil)
        runAction(SKAction.sequence([SKAction.waitForDuration(0.4),
            SKAction.runBlock(){
                expview.alpha = 0
                allphotos = UIScrollView(frame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
                allphotos.contentSize = CGSizeMake(self.frame.size.width*2, self.frame.size.height)
                allphotos.backgroundColor = SKColor.clearColor()
                allphotos.pagingEnabled = true
                allphotos.showsHorizontalScrollIndicator = false
                var onetap = UITapGestureRecognizer(target: self, action:"gobackk")
                allphotos.addGestureRecognizer(onetap)
                
                self.view!.addSubview(allphotos)
                
                var photosnum = 0
                for var i=0; i<2; i++ {
                    photosnum += 1
                    let title = UILabel(frame: CGRectMake(35, 20, self.frame.size.width-260, 80))
                    title.font = UIFont(name:"Avenir-Black", size: 30)
                    title.textColor = SKColor.whiteColor()
                    title.textAlignment = NSTextAlignment.Center
                    title.numberOfLines = 2
                    if photosnum == 1 {
                        
                        let thephoto = UIImageView(image: UIImage(named:"groupphoto.png"))
                        thephoto.frame = CGRectMake(0,0, self.frame.size.width, self.frame.size.height)
                        allphotos.addSubview(thephoto)
                        let blackrect = CALayer()
                        blackrect.backgroundColor = SKColor.blackColor().CGColor
                        blackrect.frame = CGRectMake(0, 660, self.frame.size.width, 120)
                        blackrect.opacity = 0.6
                        allphotos.layer.addSublayer(blackrect)
                        title.frame = CGRectMake(125, self.frame.size.height-170, self.frame.size.width-260, 240)
                        title.text = "This is a group photo with CODE2040 fellows and the hackathon sponsors!"
                        title.layer.shadowColor = SKColor.blackColor().CGColor
                        title.layer.shadowOffset = CGSizeMake(0, 4)
                        title.layer.shadowOpacity = 1
                        title.layer.shadowRadius = 1.0
                        title.clipsToBounds = false
                        allphotos.addSubview(title)
                        
                    }else if photosnum == 2 {
                        let thephoto = UIImageView(image: UIImage(named:"hacking.png"))
                        thephoto.frame = CGRectMake(self.frame.size.width,0, self.frame.size.width, self.frame.size.height)
                        allphotos.addSubview(thephoto)
                        let blackrect = CALayer()
                        blackrect.backgroundColor = SKColor.blackColor().CGColor
                        blackrect.frame = CGRectMake(self.frame.size.width, 660, self.frame.size.width, 120)
                        blackrect.opacity = 0.6
                        allphotos.layer.addSublayer(blackrect)
                        title.frame = CGRectMake(125+self.frame.size.width, self.frame.size.height-170, self.frame.size.width-260, 220)
                        title.text = "We were working on an iPhone app that helps people find jobs through hashtags."
                        title.layer.shadowColor = SKColor.blackColor().CGColor
                        title.layer.shadowOffset = CGSizeMake(0, 4)
                        title.layer.shadowOpacity = 1
                        title.layer.shadowRadius = 1.0
                        title.clipsToBounds = false
                        allphotos.addSubview(title)
                    }
                    
                }
                allphotosshow = 1
            }]))
    }
    
    func doublet(){
        if percentsshow == 1 {
            percentage.alpha = 0
        }
        if allphotosshow == 1 {
            allphotos.alpha = 0
        }
        if showthe == 1 {
        aboutscroll.alpha = 0
        }else if showthe == 2 {
        eduview.alpha = 0
        }else if showthe == 3 {
            expview.alpha = 0
        }else if showthe == 4 {
            projectscroll.alpha = 0
        }

        
        let reveal = SKTransition.fadeWithDuration(0.4)
        let golist = ListScene(size:self.size)
        self.view?.presentScene(golist, transition:reveal)
    }
    
    override func willMoveFromView(view: SKView) {
        
        if view.gestureRecognizers != nil {
            for gesture in view.gestureRecognizers! {
                if let recognizer = gesture as? UITapGestureRecognizer {
                    view.removeGestureRecognizer(recognizer)
                }
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        
    }
}

