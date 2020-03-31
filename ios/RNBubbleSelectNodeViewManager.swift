//
//  MagneticNodeViewManager.swift
//  react-native-bubble-select
//
//  Created by Jesse Onolememen on 29/03/2020.
//

import Foundation
import UIKit

@objc(RNBubbleSelectNodeViewManager)
class RNBubbleSelectNodeViewManager: RCTViewManager {
  
  var id: String?
  var text: String?
  var image: UIImage?
  var color: UIColor?
  var radius: CGFloat?
  var marginScale: CGFloat?
  
  // Label Styling
  var fontName: String?
  var fontSize: CGFloat?
  var fontColor: UIColor?
  var lineHeight: CGFloat?
  
  override func view() -> UIView! {
    let node = RNBubbleSelectNodeView()
    node.id = id
    node.text = text
    node.image = image
    node.color = color
    node.radius = radius
    node.marginScale = marginScale
    node.fontName = fontName
    node.fontSize = fontSize
    node.fontColor = fontColor ?? .white
    node.lineHeight = lineHeight ?? 1.1
    node.updateNode()
    return node
  }
}

// MARK:- Setters
extension RNBubbleSelectNodeViewManager {
  @objc func setId(_ id: String?) {
    self.id = id
  }
  
  @objc func setText(_ text: String?) {
    self.text = text
  }
  
  @objc func setImage(_ image: UIImage?) {
    self.image = image
  }
  
  @objc func setColor(_ color: UIColor?) {
    self.color = color
  }
  
  @objc func setRadius(_ radius: CGFloat) {
    self.radius = radius
  }
  
  @objc func setMarginScale(_ marginScale: CGFloat) {
    self.marginScale = marginScale
  }
  
  @objc func setFontSize(_ fontSize: CGFloat) {
    self.fontSize = fontSize
  }
  
  @objc func setFontName(_ fontName: String?) {
    self.fontName = fontName
  }
  
  @objc func setFontColor(_ fontColor: UIColor?) {
    self.fontColor = fontColor
  }
  
  @objc func setLineHeight(_ lineHeight: CGFloat) {
    self.lineHeight = lineHeight
  }
}
