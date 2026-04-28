//
//  ViewController.swift
//  PurelyStoryboard
//
//  Created by V01 on 5/28/24.
//

/*
   Copyright (c) 2020, VEMI Lab at the University of Maine (http://vemilab.org/, vemilab@maine.edu)
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that all of the following conditions are met:
   1. Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
   2. Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
   3. All advertising materials mentioning features or use of this software
      must display the following acknowledgement:
      This product includes software developed by the VEMI Lab at the University of Maine.
   4. Neither the name of the VEMI Lab nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED BY VEMI Lab at the University of Maine ''AS IS'' AND ANY
   EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
   WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
   DISCLAIMED. IN NO EVENT SHALL VEMI Lab BE LIABLE FOR ANY
   DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
   ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

//Welcome to the VAMLibrary Demo!!
//This is a step by step guide on how to set up VAMObjects in a ViewController
// with examples of each VAMObject so you can learn how they work before making your own

//When you want to run this project (or any project you make), make sure you run this on your phone
//because your PC or laptop doesn't vibrate and that's kinda the whole point!

//1. Make sure VAMLibrary is added to your project before importing,
    //then import both UIKit and VAMLibrary to the file, seen here
import UIKit
import VAMLibrary

//2. Next make your ViewController a VAMViewProtocol as seen below
class ViewController: UIViewController, VAMViewProtocol {

//3. Give the code a reference to your screen you're drawing VAMs on.
    // To do this, open a side-by-side and ctrl drag the view into your code.
    // it should be a UIView, I've called mine ScreenView as seen below
    @IBOutlet var ScreenView: UIView!
    
//Step 4. is at the bottom because that's where overrides typically go, please do that before step 5
     
    
//5. Now that all the setup pieces are done, you can start declaring VAMObjects variables
    //Here you can uncomment these examples to see how they look onscreen
    //Comment out objects to take them off the screen
    
    //Try changing the variables within the variables to see how each VAMObject behaves
    //For more details about each VAMObject, and the methods associated with them, check out the comments
    // in the VAMLibrary package under each VAMObject file
    
    //When implementing these in your project, just define these variables as seen below
    //The defaultViewDidLoad() you set up in Step 4 will automatically draw these shapes
    
    //VAMSlopePath is the best way to make a map, it gives nodes for each corner and draws the lines between them
    /*
    let walkingPath = VAMSlopePath(pathName: "Walking Path",
                                   points: [CGPoint(x: 40, y: 110), CGPoint(x: 40, y: 660), CGPoint(x: 360, y: 540), CGPoint(x: 40, y: 210)],
                                   lineNames: ["Dirt Trail","Dirt Trail","Dirt Trail"],
                                   pointNames: ["To the street", "Corner by the Church", "Corner by the middle of the park", "corner by the playground"],
                                   pathWidth: 30, pointRadius: 30, startRadius: 30, finishRadius: 30,
                                   pathFillColor: CGColor(red: 84/255, green: 80/255, blue: 17/255, alpha: 255/255), pathBorderColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0),
                                   pointFillColor: CGColor(red: 177/255, green: 197/255, blue: 15/255, alpha: 255/255,),
                                   startFillColor: CGColor(red: 177/255, green: 197/255, blue: 15/255, alpha: 255/255),
                                   finishFillColor: CGColor(red: 177/255, green: 197/255, blue: 15/255, alpha: 255/255),
                                   pointBorderColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0), startBorderColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0),
                                   finishBorderColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0),
                                   pathBorderWidth: 0, startBorderWidth: 0, finishBorderWidth: 0, pointBorderWidth: 0)
    */
    //VAMCircles are a good basic shape to mark landmarks on a map
    let playground = VAMCircle(objectName: "Playground", position: CGPoint(x: 114, y: 392), radius: 50, isVisible: true, fillEnabled: true, fillColor: CGColor(red: 20/255, green: 100/255, blue: 20/255, alpha: 255/255), borderEnabled: false, borderWidth: 0, borderColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0))
    let fountain = VAMCircle(objectName: "fountain", position: CGPoint(x: 210, y: 490), radius: 20, isVisible: true, fillEnabled: true, fillColor: CGColor(red: 132/255, green: 121/255, blue: 90/255, alpha: 255/255), borderEnabled: false, borderWidth: 0, borderColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0))
        
    //VAMRectangles are also good for marking landmarks on the map
//    let theRectangle = VAMRectangle(size: CGPoint(x: 10, y: 120), rotation: 0 , position: CGPoint(x: 300, y: 300), objectName: "The Rectangle", fillEnabled: false, fillColor: UIColor.red.cgColor, borderEnabled: true, borderWidth: 10, borderColor: UIColor.orange.cgColor)
    
    //Here's another circle, I slide it in using the button onscreen, see the method for that below
    let theCircle = VAMCircle(objectName: "The Circle", position: CGPoint(x: 351, y: 353), radius: 50, isVisible: true, fillEnabled: true, fillColor: UIColor.orange.cgColor, borderEnabled: true, borderWidth: 10, borderColor: UIColor.blue.cgColor)
    
    //VAMSlope is the best way to draw a line from one point to another onscreen if you don't
    // want it to be a part of a path object
    //let theSlope = VAMSlope(objectName: "the slope", width: 20, borderWidth: 5, startPoint: CGPoint(x: 100, y: 100), endPoint: CGPoint(x: 300, y: 400), fillColor: CGColor(red: 100, green: 200, blue: 50, alpha: 255), fillEnabled: true, borderColor: CGColor(gray: 255, alpha: 255), borderEnabled: true)
    //Another slope path, this one is hooked up to the slideAlongPath method below
    //Uncomment both this and the method to check it out!
    
    /*
    let theSlopePath = VAMSlopePath(pathName: "pathink",
                                    points: [CGPoint(x: 200, y: 300), CGPoint(x: 100, y: 300), CGPoint(x: 300, y: 100), CGPoint(x: 400, y: 350), CGPoint(x: 250, y: 500), CGPoint(x: 250, y: 600), CGPoint(x: 50, y: 550), CGPoint(x: 300, y: 325)],
                                    lineNames: ["1", "2", "3", "4", "5", "6", "7"],
                                    pointNames: ["a", "b", "c", "d", "e", "f", "g", "h"],
                                    pathWidth: 30, pointRadius: 22, startRadius: 22, finishRadius: 22,
                                    pathFillColor: UIColor.lightGray.cgColor,
                                    pathBorderColor: UIColor.white.cgColor,
                                    pointFillColor: UIColor.yellow.cgColor,
                                    startFillColor: UIColor.green.cgColor,
                                    finishFillColor: UIColor.red.cgColor,
                                    pointBorderColor: UIColor.white.cgColor,
                                    startBorderColor: UIColor.blue.cgColor,
                                    finishBorderColor: UIColor.blue.cgColor,
                                    pathBorderWidth: 3, startBorderWidth: 3, finishBorderWidth: 3, pointBorderWidth: 3)
    */
    
// WARNING
    //VAMLine is a more efficient way to draw lines onscreen, just keep in mind that Swift does not natively
    //support lines that are not perpendicular or parallel to the screen (as in it can't draw diagonals)
    //I left this in because it is much less intensive than VAMSlope, and they work well for a grid pattern
//    let theLine = VAMLine(objectName: "The Line", fillEnabled: true, fillColor: UIColor.green.cgColor, borderEnabled: true, borderWidth: 5, borderColor: UIColor.systemBlue.cgColor, startPoint: CGPoint(x: 50, y: 500), endPoint: CGPoint(x: 300, y: 500), width: 30)

// WARNING
    //VAMPath draws using VAMLine objects, so don't try to make the path diagonal at any point
//    let thePath = VAMPath(pathName: "the path", points: [CGPoint(x: 150, y: 300), CGPoint(x: 50, y: 300), CGPoint(x: 50, y: 500), CGPoint(x: 300, y: 500), CGPoint(x: 300, y: 200), CGPoint(x: 100, y: 200)], lineNames: ["a", "b", "c", "d", "e"], pointNames: ["first", "second", "third", "fourth", "fifth", "sixth"], pathWidth: 30, pointRadius: 30, startRadius: 30, finishRadius: 30, pathFillColor: UIColor.systemBlue.cgColor, pathBorderColor: UIColor.white.cgColor, pointFillColor: UIColor.cyan.cgColor, startFillColor: UIColor.systemOrange.cgColor, finishFillColor: UIColor.systemGray.cgColor, pointBorderColor: UIColor.darkGray.cgColor, startBorderColor: UIColor.green.cgColor, finishBorderColor: UIColor.magenta.cgColor, pathBorderWidth: 3, startBorderWidth: 3, finishBorderWidth: 3, pointBorderWidth: 3)
    
// WARNING
    //VAMCurve and VAMBezierCurve are shoddy works in progress, I left them in incase anyone
    // cares to mess around with them, but they are by no means finished or fully functional
    
//    let theCurve = VAMCurve(objectName: "Curvy", width: 40, borderWidth: 5, points: [CGPoint(x: 100, y: 100), CGPoint(x: 200, y: 200), CGPoint(x: 300, y: 100)], fillColor: UIColor.green.cgColor, fillEnabled: true, borderColor: UIColor.blue.cgColor, borderEnabled: true)
//    let theBezierCurve = VAMBezierCurve(objectName: "Curved", fillEnabled: true, fillColor: UIColor.cyan.cgColor, borderEnabled: true, borderWidth: 5, borderColor: UIColor.magenta.cgColor, startPoint: CGPoint(x: 50, y: 300), midPoint1: CGPoint(x: 150, y: 200), midPoint2: CGPoint(x: 250, y: 300), endPoint: CGPoint(x: 350, y: 400), width: 20)
    
    
    
    //The method VAMCircle.slide() needs a programatic trigger. This can be during ViewDidLoad,
    // on some kind of timer, etc. In this case, I used the button seen onscreen as the trigger:
    @IBAction func slideCircle(_ sender: UIButton) {
        
        //This method will slide a circle from one point to another
        theCircle.slide(startPoint: CGPoint(x: 100, y: 100), endPoint: CGPoint(x: 300, y: 650), stepFrequency: 60, slideTime: 2, view: ScreenView)
        
        //This method will slide a circle along a path, good for making someone trace the path in a certain direction
        //Use the addedDelay var to make the circle wait at each point for a set time
        //Uncomment both this method and theSlopePath object above to check it out,
        // but make sure you recomment theCircle.slide() first!
        //theCircle.slideAlongPath(path: theSlopePath, speed: 60, refreshRate: 30, addedDelay: 0.0, view: ScreenView)
    }

    
//4. These typical swift functions needed to be overridden to make this library work
    //You can just copy all these override funcs here and paste them into your project
    //If you want different functionality than what is default,
    //you can make your own and tweak them at your own risk
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultViewDidLoad(view: ScreenView)
        //Add other ViewDidLoad actions here, they will act as in a normal ViewDidLoad
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            defaultTouchesBegan(touch: touches.first!)
        }
        
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            defaultTouchesMoved(touch: touches.first!)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        defaultTouchesEnded()
    }
    
}



