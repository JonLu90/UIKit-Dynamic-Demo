//
//  FaceIconView.swift
//  Newspick
//
//  Created by JonLu on 1/1/18.
//  Copyright © 2018 JonLu. All rights reserved.
//

import UIKit

class FaceIconView: UIView {
  
  var iconImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = UIColor.white
    setupUI()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    configure()
  }
  
  func setupUI() {
    addSubview(iconImageView)
  }
  
  func configure() {
    iconImageView.frame = self.frame
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
