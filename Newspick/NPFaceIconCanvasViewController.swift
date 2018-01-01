//
//  NPFaceIconCanvasViewController.swift
//  Newspick
//
//  Created by JonLu on 1/1/18.
//  Copyright © 2018 JonLu. All rights reserved.
//

import UIKit
import SDWebImage

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
  
  private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self.faceIconCanvas)
  
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
    
    loadFaceIconImages()
    initializeAttachmentBehaviors()
    configureDynamicItemBehavior()
    startSpinning(angle())
    registerPanGesture()
  }
  
  func loadFaceIconImages() {
    faceIcon1.iconImageView.sd_setImage(with: URL(string: ImageURLInfo.urlData1), completed: nil)
    faceIcon2.iconImageView.sd_setImage(with: URL(string: ImageURLInfo.urlData2), completed: nil)
    faceIcon3.iconImageView.sd_setImage(with: URL(string: ImageURLInfo.urlData3), completed: nil)
    faceIcon4.iconImageView.sd_setImage(with: URL(string: ImageURLInfo.urlData4), completed: nil)
    faceIcon5.iconImageView.sd_setImage(with: URL(string: ImageURLInfo.urlData5), completed: nil)
    faceIcon6.iconImageView.sd_setImage(with: URL(string: ImageURLInfo.urlData6), completed: nil)
  }
  
  // MARK: UIKit Dynamics behavior
  // Attachment behaviors
  func initializeAttachmentBehaviors() {
    let attachment1 = UIAttachmentBehavior(item: faceIcon1, attachedToAnchor: faceIconCanvas.center)
    let attachment2 = UIAttachmentBehavior(item: faceIcon2, attachedToAnchor: faceIconCanvas.center)
    let attachment3 = UIAttachmentBehavior(item: faceIcon3, attachedToAnchor: faceIconCanvas.center)
    let attachment4 = UIAttachmentBehavior(item: faceIcon4, attachedToAnchor: faceIconCanvas.center)
    let attachment5 = UIAttachmentBehavior(item: faceIcon5, attachedToAnchor: faceIconCanvas.center)
    let attachment6 = UIAttachmentBehavior(item: faceIcon6, attachedToAnchor: faceIconCanvas.center)
    let attachment7 = UIAttachmentBehavior(item: faceIcon1, attachedTo: faceIcon2)
    let attachment8 = UIAttachmentBehavior(item: faceIcon2, attachedTo: faceIcon3)
    let attachment9 = UIAttachmentBehavior(item: faceIcon3, attachedTo: faceIcon4)
    let attachment10 = UIAttachmentBehavior(item: faceIcon4, attachedTo: faceIcon5)
    let attachment11 = UIAttachmentBehavior(item: faceIcon5, attachedTo: faceIcon6)
    let attachment12 = UIAttachmentBehavior(item: faceIcon6, attachedTo: faceIcon1)
    animator.addBehavior(attachment1)
    animator.addBehavior(attachment2)
    animator.addBehavior(attachment3)
    animator.addBehavior(attachment4)
    animator.addBehavior(attachment5)
    animator.addBehavior(attachment6)
    animator.addBehavior(attachment7)
    animator.addBehavior(attachment8)
    animator.addBehavior(attachment9)
    animator.addBehavior(attachment10)
    animator.addBehavior(attachment11)
    animator.addBehavior(attachment12)
  }
  
  // Start to spin
  func startSpinning(_ pushPulseAngle: CGFloat) {
    // Initialize a push pulse on faceIcon1
    let push = UIPushBehavior(items: [faceIcon1], mode: .instantaneous)
    push.magnitude = 0.8
    push.angle = pushPulseAngle
    animator.addBehavior(push)
  }
  
  // Help function: to find the angle that perpendicular to faceIcon1 radius
  func angle() -> CGFloat {
    let currentPosition = faceIcon1.layer.position
    let vectorTowardsRadius = CGVector(dx: currentPosition.x-faceIconCanvas.center.x, dy: currentPosition.y-faceIconCanvas.center.y)
    let angle = atan2(vectorTowardsRadius.dx, -vectorTowardsRadius.dy)
    return angle*180/CGFloat.pi
  }
  
  // Configure UIDynamicItemBehavior
  func configureDynamicItemBehavior() {
    let items = [faceIcon1, faceIcon2, faceIcon3, faceIcon4, faceIcon5, faceIcon6]
    let itemBeahavior = UIDynamicItemBehavior(items: items)
    itemBeahavior.angularResistance = 0
    itemBeahavior.friction = 0
    itemBeahavior.elasticity = 1
    itemBeahavior.resistance = 0
    animator.addBehavior(itemBeahavior)
  }
  
  var createdAttachmentByPanGesture: UIAttachmentBehavior! {
    willSet {
      if createdAttachmentByPanGesture != nil {
        animator.removeBehavior(createdAttachmentByPanGesture)
      }
    }
    didSet {
      if createdAttachmentByPanGesture != nil {
        animator.addBehavior(createdAttachmentByPanGesture)
      }
    }
  }
  
  // MARK: Pan gestures
  func panGesture(_ sender: UIPanGestureRecognizer) {
    let view = sender.view!
    let gesturePoint = sender.location(in: view)
    
    switch sender.state {
    case .began:
      createdAttachmentByPanGesture = UIAttachmentBehavior(item: view, attachedToAnchor: gesturePoint)
    case .changed:
      createdAttachmentByPanGesture.anchorPoint = gesturePoint
    case .ended:
      createdAttachmentByPanGesture = nil
    default:
      createdAttachmentByPanGesture = nil
    }
  }
  
  // Register pan gestures to face icons
  func registerPanGesture() {
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
    faceIcon1.addGestureRecognizer(panGesture)
    faceIcon2.addGestureRecognizer(panGesture)
    faceIcon3.addGestureRecognizer(panGesture)
    faceIcon4.addGestureRecognizer(panGesture)
    faceIcon5.addGestureRecognizer(panGesture)
    faceIcon6.addGestureRecognizer(panGesture)
  }
  
  // MARK: Add subviews
  func setupUI() {
    self.view.addSubview(faceIconCanvas)
    faceIconCanvas.addSubview(faceIcon1)
    faceIconCanvas.addSubview(faceIcon2)
    faceIconCanvas.addSubview(faceIcon3)
    faceIconCanvas.addSubview(faceIcon4)
    faceIconCanvas.addSubview(faceIcon5)
    faceIconCanvas.addSubview(faceIcon6)
  }
  
  // MARK: Layout UI components to initial positions
  func configure() {
    faceIconCanvas.frame = self.view.frame
    
    faceIcon1.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon1.center = CGPoint(x: faceIconCanvas.center.x, y: faceIconCanvas.center.y-faceIconCanvas.circleRadius)
    faceIcon1.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    faceIcon1.clipsToBounds = true
    
    faceIcon2.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon2.center = CGPoint(x: faceIconCanvas.center.x+CGFloat(sqrt(3)/2)*faceIconCanvas.circleRadius, y: faceIconCanvas.center.y-faceIconCanvas.circleRadius/2)
    faceIcon2.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    faceIcon2.clipsToBounds = true
    
    faceIcon3.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon3.center = CGPoint(x: faceIconCanvas.center.x+CGFloat(sqrt(3)/2)*faceIconCanvas.circleRadius, y: faceIconCanvas.center.y+faceIconCanvas.circleRadius/2)
    faceIcon3.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    faceIcon3.clipsToBounds = true
    
    faceIcon4.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon4.center = CGPoint(x: faceIconCanvas.center.x, y: faceIconCanvas.center.y+faceIconCanvas.circleRadius)
    faceIcon4.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    faceIcon4.clipsToBounds = true
    
    faceIcon5.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon5.center = CGPoint(x: faceIconCanvas.center.x-CGFloat(sqrt(3)/2)*faceIconCanvas.circleRadius, y: faceIconCanvas.center.y+faceIconCanvas.circleRadius/2)
    faceIcon5.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    faceIcon5.clipsToBounds = true
    
    faceIcon6.frame = CGRect(x: 0, y: 0, width: FaceIconCanvasViewConstants.faceIconRadius, height: FaceIconCanvasViewConstants.faceIconRadius)
    faceIcon6.center = CGPoint(x: faceIconCanvas.center.x-CGFloat(sqrt(3)/2)*faceIconCanvas.circleRadius, y: faceIconCanvas.center.y-faceIconCanvas.circleRadius/2)
    faceIcon6.layer.cornerRadius = FaceIconCanvasViewConstants.faceIconRadius/2
    faceIcon6.clipsToBounds = true
  }
}
