//
//  RNBubbleSelectViewManager.swift
//  react-native-bubble-select
//
//  Created by Jesse Onolememen on 29/03/2020.
//

import Foundation
import Magnetic

@objc(RNBubbleSelectViewManager)
class RNBubbleSelectViewManager: RCTViewManager {
  var magnetic: Magnetic?
  var onSelectNode: RCTDirectEventBlock?
  var onDeselectNode: RCTDirectEventBlock?
  var allowsMultipleSelection: Bool?
  
  override func view() -> UIView! {
    let magneticView = MagneticView()
    magnetic = magneticView.magnetic
    if let allowsMultipleSelection = allowsMultipleSelection {
      magnetic?.allowsMultipleSelection = allowsMultipleSelection
    }
    return magneticView
  }
  
  override class func requiresMainQueueSetup() -> Bool {
    return false
  }
}

// MARK:- Setters
extension RNBubbleSelectViewManager {
  @objc func setOnSelectNode(_ onSelectNode: RCTDirectEventBlock?) {
    self.onSelectNode = onSelectNode
  }
  
  @objc func setOnDeselectNode(_ onDeselectNode: RCTDirectEventBlock?) {
    self.onDeselectNode = onDeselectNode
  }
  
  @objc func setAllowsMultipleSelection(_ allowsMultipleSelection: Bool) {
    self.allowsMultipleSelection = allowsMultipleSelection
  }
}

// MARK:- MagneticDelegate
extension RNBubbleSelectViewManager: MagneticDelegate {
  func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
    onSelectNode?([
      "text": node.text ?? "",
      "id": node.id ?? ""
    ])
  }

  func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
    onDeselectNode?([
      "text": node.text ?? "",
      "id": node.id ?? ""
    ])
  }
}
