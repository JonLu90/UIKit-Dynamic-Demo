//
//  FaceIconCanvasView.swift
//  Newspick
//
//  Created by JonLu on 1/1/18.
//  Copyright © 2018 JonLu. All rights reserved.
//

import UIKit

class FaceIconCanvasView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = UIColor.black
  }
  
  var circleRadius: CGFloat {
    return min(bounds.size.width, bounds.size.height)/2 * FaceIconCanvasViewConstants.scale - FaceIconCanvasViewConstants.faceIconRadius
  }
  
  private var circleCenter: CGPoint {
    return CGPoint(x: bounds.midX, y: bounds.midY)
  }
  
  fileprivate func pathForCircle() -> UIBezierPath {
    let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
    path.lineWidth = FaceIconCanvasViewConstants.bezierPathLineWidth
    return path
  }
  
  override func draw(_ rect: CGRect) {
    UIColor.gray.set()
    pathForCircle().stroke()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
