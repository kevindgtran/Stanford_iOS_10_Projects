//
//  FaceView.swift
//  FaceIt
//
//  Created by Kevin Tran on 10/24/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

@IBDesignable //allows us to see the simulated app in the interface builder!
class FaceView: UIView {
    
    @IBInspectable //allows us to make modifications on the storyboard through the inspector
    var scale: CGFloat = 0.90
    
    @IBInspectable
    var eyesOpen: Bool = true
    
    @IBInspectable
    var mouthCurvature: Double = -0.5 //1.0 is full smile, -1.0 is full frown
    
    @IBInspectable
    var line: CGFloat = 5.0
    
    @IBInspectable
    var color: UIColor = UIColor.blue
    
    //create a radius for the face
    private var skullRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    //creating the center point
    private var skullCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    //enum for both eyes
    private enum Eye {
        case left
        case right
    }
    //create bezierPath for eyes
    private func pathForEye(_ eye: Eye) -> UIBezierPath {
        func centerOfEye(_ eye: Eye) ->CGPoint {
            let eyeOffset = skullRadius / Ratios.skullRadiusToEyeOffSet
            var eyeCenter = skullCenter
            eyeCenter.y -= eyeOffset
            //creates both eyes
            eyeCenter.x += ((eye == .left) ? -1 : 1) * eyeOffset
            return eyeCenter
        }
        
        let eyeRadius = skullRadius / Ratios.skillRadiusToEyeRadius
        let eyeCenter = centerOfEye(eye)
        //create closed and open eyes
        let path: UIBezierPath
        if eyesOpen {
            path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        } else {
            path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
        }
        path.lineWidth = line
        return path
    }
    
    private func pathForMouth() -> UIBezierPath {
        let mouthWidth = skullRadius / Ratios.skullRadiusToMouthWidth
        let mouthHeight = skullRadius / Ratios.skullRadiusToMouthHeight
        let mouthOffSet = skullRadius / Ratios.skullRadiusToMouthOffset
    
        let mouthRect = CGRect(
            x: skullCenter.x - mouthWidth / 2,
            y: skullCenter.y + mouthOffSet,
            width: mouthWidth, height: mouthHeight
        )
        
        let smileOffSet = CGFloat(max(-1, min(mouthCurvature, 1))) * mouthRect.height
        
        //create the smile/ frown
        let start = CGPoint(x: mouthRect.minX, y: mouthRect.midY)
        let end = CGPoint(x: mouthRect.maxX, y: mouthRect.midY)
        
        //create control points
        let cp1 = CGPoint(x: start.x + mouthRect.width / 3, y: start.y + smileOffSet)
        let cp2 = CGPoint(x: end.x - mouthRect.width / 3, y: start.y + smileOffSet)
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = line
        return path
    }
    
    //create bezierPath for face
    private func pathForSkull() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: false)
        path.lineWidth = line
        return path
    }
    
    //draw function
    override func draw(_ rect: CGRect) {
        //set both the stroke and fill
        color.set()
        pathForSkull().stroke()
        pathForEye(.left).stroke()
        pathForEye(.right).stroke()
        pathForMouth().stroke()
    }
    
    //all ratios
    private struct Ratios {
        static let skullRadiusToEyeOffSet: CGFloat = 3
        static let skillRadiusToEyeRadius: CGFloat = 10
        static let skullRadiusToMouthWidth: CGFloat = 1
        static let skullRadiusToMouthHeight: CGFloat = 3
        static let skullRadiusToMouthOffset: CGFloat = 3
    }
}

//NOTE: change content mode to draw to avoid circle from filling (stretching) when view is rotated horizantally
//create shortcut snippets by creating code snippets in the Code Snippet Library
