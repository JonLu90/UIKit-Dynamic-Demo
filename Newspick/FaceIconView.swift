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
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
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
    // MARK: Autolayout code for imageview
    iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    self.rightAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 0).isActive = true
    self.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 0).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
