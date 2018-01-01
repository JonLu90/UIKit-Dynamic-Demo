//
//  UtilityFunction.swift
//  Newspick
//
//  Created by JonLu on 12/27/17.
//  Copyright © 2017 JonLu. All rights reserved.
//

import Foundation
import SVProgressHUD

struct UtilityFunction {
  
  static func showLoadingHud(_ message: String) {
    SVProgressHUD.show(withStatus: message)
    SVProgressHUD.dismiss(withDelay: 5)
  }
}
