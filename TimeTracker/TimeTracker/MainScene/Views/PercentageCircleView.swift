//
//  PercentageCircleView.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/21/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class PercentageCircleView: UIView {
  
  var percentage: Float?
  var lineColor: UIColor?
  var circleShapeLayer: CAShapeLayer?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    draw()
    //    displayPercentage(percentage: 0)
    //    UIView.animate(withDuration: 0.5, animations: {
    //      self.displayPercentage(percentage: self.percentage!)
    //    })
    self.displayPercentage(percentage: self.percentage!)
    self.animateCircle(duration: 2.0)
  }
  
  func draw() {
    let path = UIBezierPath(
      roundedRect: CGRect(x: 2.5, y: 2.5, width: self.bounds.width - 5, height: self.bounds.height - 5),
      cornerRadius: (self.bounds.width - 5) / 2)
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.lineWidth = 5
    shapeLayer.strokeColor = hexStringToUIColor(hex: "E5ECF3").cgColor
    shapeLayer.fillColor = UIColor.white.cgColor
    self.layer.addSublayer(shapeLayer)
  }
  
  func displayPercentage(percentage: Float) {
    let startPoint = -CGFloat(Float.pi / 2)
    let endPoint = -CGFloat(Float.pi / 2) + CGFloat(Float.pi * 2 * percentage)
    let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2), radius: (self.bounds.width - 5) / 2, startAngle: startPoint, endAngle: endPoint, clockwise: true)
    circleShapeLayer = CAShapeLayer()
    circleShapeLayer!.path = path.cgPath
    circleShapeLayer!.lineWidth = 5
    circleShapeLayer!.strokeColor = lineColor?.cgColor
    circleShapeLayer!.fillColor = UIColor.clear.cgColor
    circleShapeLayer!.lineCap = CAShapeLayerLineCap.round
    circleShapeLayer!.strokeEnd = 0.0
    self.layer.addSublayer(circleShapeLayer!)
  }
  
  func animateCircle(duration: TimeInterval) {
    // We want to animate the strokeEnd property of the circleLayer
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    
    // Set the animation duration appropriately
    animation.duration = duration
    
    // Animate from 0 (no circle) to 1 (full circle)
    animation.fromValue = 0
    animation.toValue = 1
    
    // Do a easeOut animation (i.e. the speed of the animation stays the same)
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    
    // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
    // right value when the animation ends.
    circleShapeLayer!.strokeEnd = 1.0
    
    // Do the actual animation
    circleShapeLayer?.add(animation, forKey: "animateCircle")
  }
}
