//
//  NPFaceIconCanvasViewController.swift
//  Newspick
//
//  Created by JonLu on 1/1/18.
//  Copyright © 2018 JonLu. All rights reserved.
//

import UIKit

class NPFaceIconCanvaseViewController: UIViewController {
  
  var faceIcon1: FaceIconView = {
    let faceIcon = FaceIconView()
    return faceIcon
  }()
  
  var faceIcon2: FaceIconView = {
    let faceIcon = FaceIconView()
    return faceIcon
  }()
  
  var faceIcon3: FaceIconView = {
    let faceIcon = FaceIconView()
    return faceIcon
  }()
  
  var faceIcon4: FaceIconView = {
    let faceIcon = FaceIconView()
    return faceIcon
  }()
  
  var faceIcon5: FaceIconView = {
    let faceIcon = FaceIconView()
    return faceIcon
  }()
  
  var faceIcon6: FaceIconView = {
    let faceIcon = FaceIconView()
    return faceIcon
  }()
  
  var faceIconCanvas: FaceIconCanvasView = {
    let view = FaceIconCanvasView()
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    configure()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
  func setupUI() {
    self.view.addSubview(faceIconCanvas)
    faceIconCanvas.addSubview(faceIcon1)
    faceIconCanvas.addSubview(faceIcon2)
    faceIconCanvas.addSubview(faceIcon3)
    faceIconCanvas.addSubview(faceIcon4)
    faceIconCanvas.addSubview(faceIcon5)
    faceIconCanvas.addSubview(faceIcon6)
  }
  
  func configure() {
    faceIconCanvas.frame = self.view.frame
    
    faceIcon1.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon1.center = CGPoint(x: faceIconCanvas.center.x, y: faceIconCanvas.center.y-faceIconCanvas.circleRadius)
    faceIcon1.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    
    faceIcon2.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon2.center = CGPoint(x: faceIconCanvas.center.x+CGFloat(sqrt(3)/2)*faceIconCanvas.circleRadius, y: faceIconCanvas.center.y-faceIconCanvas.circleRadius/2)
    faceIcon2.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    
    faceIcon3.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon3.center = CGPoint(x: faceIconCanvas.center.x+CGFloat(sqrt(3)/2)*faceIconCanvas.circleRadius, y: faceIconCanvas.center.y+faceIconCanvas.circleRadius/2)
    faceIcon3.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    
    faceIcon4.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon4.center = CGPoint(x: faceIconCanvas.center.x, y: faceIconCanvas.center.y+faceIconCanvas.circleRadius)
    faceIcon4.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    
    faceIcon5.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon5.center = CGPoint(x: faceIconCanvas.center.x-CGFloat(sqrt(3)/2)*faceIconCanvas.circleRadius, y: faceIconCanvas.center.y+faceIconCanvas.circleRadius/2)
    faceIcon5.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    
    faceIcon6.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon6.center = CGPoint(x: faceIconCanvas.center.x-CGFloat(sqrt(3)/2)*faceIconCanvas.circleRadius, y: faceIconCanvas.center.y-faceIconCanvas.circleRadius/2)
    faceIcon6.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
  }
}
