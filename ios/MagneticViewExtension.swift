//
//  MagneticViewExtension.swift
//  react-native-bubble-select
//
//  Created by Jesse Onolememen on 29/03/2020.
//

import Foundation

extension MagneticView {
  
  override public func insertReactSubview(_ subview: UIView!, at atIndex: Int) {
    guard let subview = subview as? RNBubbleSelectNodeView else { return }
    magnetic.addChild(subview.node)
  }
  
  public override func removeReactSubview(_ subview: UIView!) {
    guard let subview = subview as? RNBubbleSelectNodeView else { return }
    subview.node.removeFromParent()
  }
  
  // Stub functions to make sure RN works
  @objc func setOnSelect(_ onSelectNode: RCTDirectEventBlock?) {
  }
  
  @objc func setOnDeselectNode(_ onDeselectNode: RCTDirectEventBlock?) {
  }
  
  @objc func setAllowsMultipleSelection(_ allowsMultipleSelection: Bool) {
  }
}

