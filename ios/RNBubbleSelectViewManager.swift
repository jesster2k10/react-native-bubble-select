//
//  RNBubbleSelectViewManager.swift
//  react-native-bubble-select
//
//  Created by Jesse Onolememen on 29/03/2020.
//

import Foundation

@objc(RNBubbleSelectViewManager)
class RNBubbleSelectViewManager: RCTViewManager {
  override func view() -> UIView! {
    return RNBubbleMagneticView()
  }
  
  override class func requiresMainQueueSetup() -> Bool {
    return false
  }
}
