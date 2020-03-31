//
//  RNBubbleMagneticView.swift
//  react-native-bubble-select
//
//  Created by Jesse Onolememen on 29/03/2020.
//

import Foundation
import UIKit

class RNBubbleMagneticView: UIView {
  var magnetic: Magnetic!
  
  var allowsMultipleSelection: Bool = true {
    didSet {
      magnetic.allowsMultipleSelection = allowsMultipleSelection
    }
  }
  
  var removeNodeOnLongPress: Bool = false {
    didSet {
      magnetic.removeNodeOnLongPress = removeNodeOnLongPress
    }
  }
  
  var longPressDuration: TimeInterval? {
    didSet {
      guard let duration = longPressDuration else { return }
      magnetic.longPressDuration = duration
    }
  }
  
  var onSelect: RCTDirectEventBlock?
  var onDeselect: RCTDirectEventBlock?
  var onRemove: RCTDirectEventBlock?
  
  lazy var magneticView: MagneticView = {
    let magneticView = MagneticView()
    magnetic = magneticView.magnetic
    magnetic.magneticDelegate = self
    // magnetic.scene?.view?.showsFPS = true
    // magnetic.scene?.view?.showsPhysics = true
    magneticView.frame = frame
    magneticView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    return magneticView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  private func setupView() {
    addSubview(magneticView)
    magnetic.calculateAccumulatedFrame()
  }
  
  override public func insertReactSubview(_ subview: UIView!, at atIndex: Int) {
    guard let subview = subview as? RNBubbleSelectNodeView else { return }
    magnetic.addChild(subview.node)
  }
  
  public override func removeReactSubview(_ subview: UIView!) {
    guard let subview = subview as? RNBubbleSelectNodeView else { return }
    subview.node.removeFromParent()
  }
}

// MARK: - Setters
extension RNBubbleMagneticView {
  @objc func setAllowsMultipleSelection(_ allowsMultipleSelection: Bool) {
    self.allowsMultipleSelection = allowsMultipleSelection
  }
  
  // Stub functions to make sure RN works
  @objc func setOnSelect(_ onSelect: RCTDirectEventBlock?) {
    self.onSelect = onSelect
  }
  
  @objc func setOnDeselect(_ onDeselect: RCTDirectEventBlock?) {
    self.onDeselect = onDeselect
  }
    
  @objc func setOnRemove(_ onRemove: RCTDirectEventBlock?) {
    self.onRemove = onRemove
  }
  
  @objc func setLongPressDuration(_ longPressDuration: CGFloat) {
    self.longPressDuration = TimeInterval(longPressDuration)
  }
  
  @objc func setRemoveNodeOnLongPress(_ removeNodeOnLongPress: Bool) {
    self.removeNodeOnLongPress = removeNodeOnLongPress
  }
}

extension RNBubbleMagneticView: MagneticDelegate {
  func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
    onSelect?([
      "text": node.text ?? "",
      "id": node.id ?? ""
    ])
  }

  func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
    onDeselect?([
      "text": node.text ?? "",
      "id": node.id ?? ""
    ])
  }
  
  func magnetic(_ magnetic: Magnetic, didRemove node: Node) {
    onRemove?([
      "text": node.text ?? "",
      "id": node.id ?? ""
    ])
  }
}
