//
//  LoginStub.swift
//  Newspick
//
//  Created by JonLu on 1/2/18.
//  Copyright © 2018 JonLu. All rights reserved.
//

import Foundation

struct LoginStub {
  
  public static let legalUserName = "admin@newspick.com"
  public static let legalPassword = "123"
  
  public static func testLoginSuccessUsingStub() -> Bool {
    let responseString = "username: admin@newspick.com id: 123456"
    let responseData = responseString.data(using: .utf8)
    
    let sessionStub = URLSessionStub(data: responseData, response: nil, error: nil)
    
    // inject sessionStub into networking api request
    // if result reach expectation return true otherwise return false
    
    let expectedResponseString = "user not found!"
    let expectedResponseData = expectedResponseString.data(using: .utf8)
    
    return responseData == expectedResponseData
  }
  
}
