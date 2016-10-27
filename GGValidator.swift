//
//  GGValidator.swift
//  PLCodeTest
//
//  Created by GaoYuan on 10/8/16.
//  Copyright © 2016 YuanGao. All rights reserved.
//


enum GGValidator {
  case required
}

extension GGValidator {
  func isValid(_ attrs: Set<String>) -> Bool {
    switch self {
    case .required:
      let length = attrs.filter({ attr in attr == "" }).count
      return length != 0 ? false : true
    }
  }
  
  func isValidWithArray(_ a: Set<String>, _ block: (String) -> Bool) -> Bool {
    switch self {
    case .required:
      var flag = true
      
      for e in a {
        flag = block(e)
      }
      
      return !flag
    }
  }
  
  func isValidGeneric<T: Equatable>(_ a: Set<T>, _ checker: T) -> Bool {
    switch self {
    case .required:
      var flag = true
      
      for e in a {
        flag = e == checker
      }
      
      return !flag
    }
  }
}
