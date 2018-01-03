//
//  URLSessionStub.swift
//  Newspick
//
//  Created by JonLu on 1/2/18.
//  Copyright © 2018 JonLu. All rights reserved.
//

import Foundation

public final class URLSessionStub {
  var url: URL?
  var request: URLRequest?
  private let dataTaskStub: URLSessionDataTaskStub
  
  public init(data: Data?, response: URLResponse?, error: Error?) {
    dataTaskStub = URLSessionDataTaskStub()
    dataTaskStub.taskResponse = (data, response, error)
  }
  
  public func dataTaskWithURL(url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    self.url = url
    self.dataTaskStub.completionHandler = completionHandler
    return self.dataTaskStub
  }
  
  public func dataTaskWithRequest(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    self.request = request
    self.dataTaskStub.completionHandler = completionHandler
    return self.dataTaskStub
  }
}

private final class URLSessionDataTaskStub: URLSessionDataTask {
  typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
  var completionHandler: CompletionHandler?
  var taskResponse: (Data?, URLResponse?, Error?)?
  
  override func resume() {
    completionHandler?(taskResponse?.0, taskResponse?.1, taskResponse?.2)
  }
}
