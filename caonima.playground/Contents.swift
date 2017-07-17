//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var str = "Hello, playground"

let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 800))
view.backgroundColor = UIColor.white

PlaygroundPage.current.liveView = view


class Robot: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: rect.insetBy(dx: 1, dy: 1))
        let ovalPath2 = UIBezierPath(ovalIn: rect.insetBy(dx: 10, dy: 10))
        UIColor.blue.setStroke()
        UIColor.white.setFill()
        
        ovalPath.lineWidth = 1
        ovalPath.stroke()
        ovalPath.fill()
        ovalPath2.lineWidth = 1
        ovalPath2.stroke()

    }
}

class Tail: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Gradient Declarations
        let gradient = CGGradient(colorsSpace: nil, colors: [UIColor.blue.cgColor, UIColor.white.cgColor] as CFArray, locations: [0, 1])!
        
        //// Rectangle Drawing
        context.saveGState()
//        context.translateBy(x: 131, y: 18)
//        context.rotate(by: 57.21 * CGFloat.pi/180)
        
        let rectanglePath = UIBezierPath(rect: rect)
        context.saveGState()
        rectanglePath.addClip()
        
        let start = CGPoint(x: 0, y: rect.size.height / 2)
        let end = CGPoint(x: rect.size.width, y: rect.size.height / 2)
        
        context.drawLinearGradient(gradient, start: start, end: end, options: [])
        context.restoreGState()
        
    }
}

let robot = Robot()
robot.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

let tail = Tail()
tail.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
tail.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
tail.layer.position = robot.layer.position

view.addSubview(tail)
view.addSubview(robot)

func robotPosition(by time: TimeInterval) -> CGPoint {
    let x = M_PI / 4
    
    fatalError()
}

var passed:Double = 0

func move(to end: CGPoint, duration: TimeInterval) {
    let start = robot.layer.position
    let angle = atan((end.y - start.y) / (end.x - start.x))
    tail.transform = CGAffineTransform(rotationAngle: angle)
//    let animate = CABasicAnimation(keyPath: "position")
//    animate.fromValue = start
//    animate.toValue = end
//    animate.duration = 5
//    robot.layer.add(animate, forKey: "position")
    Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
        passed += 0.01
        print("passed:\(passed)")
        if passed >= 5 {
            timer.invalidate()
        }
    }
}

//move(to: CGPoint(x: 500, y: 700))





