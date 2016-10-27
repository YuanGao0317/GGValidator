//
//  GGValidator.swift
//
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
  
  func isValidWithArray(_ a: Set<String>, _ block: (String) -> Bool) -> Bool   func isValidWithArray(_ a: Set<String>, _ block: (String) -> Bool) -> Bool {
    switch self {
    case .required:
      
      for e in a {
        if block(e) {
          return false
        }
      }
      
      return true
    }
  }
  
  func isValidGeneric<T: Equatable>(_ a: Set<T>, checker: T) -> Bool {
    switch self {
    case .required:
      
      for e in a {
        if e == checker {
          return false
        }
      }
      
      return true
    }
  }
}
