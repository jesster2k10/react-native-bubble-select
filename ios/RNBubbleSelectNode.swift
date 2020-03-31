//
//  MagneticNode.swift
//  BubbleSelect
//
//  Created by Jesse Onolememen on 29/03/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class RNBubbleSelectNodeView: UIView {
  var id: String?
  var text: String?
  var image: UIImage?
  var color: UIColor?
  var radius: CGFloat?
  var marginScale: CGFloat?
  var padding: CGFloat?
  
  // Label Styling
  var fontName: String?
  var fontSize: CGFloat?
  var fontColor: UIColor?
  var lineHeight: CGFloat?
  var borderColor: UIColor?
  var borderWidth: CGFloat?
  
  var selectedScale: CGFloat?
  var deselectedScale: CGFloat?
  var animationDuration: CGFloat?
  var selectedColor: UIColor?
  var selectedFontColor: UIColor?
  
  lazy var node: Node = {
    let node = Node(
      text: text,
      image: image,
      color: color ?? .black,
      radius: radius ?? 30
    )
    return node
  }()
  
  override func didUpdateReactSubviews() {
    updateNode()
  }
  
  func updateNode() {
    node.id = id
    node.fontName = fontName ?? Node.Defaults.fontName
    node.fontSize = fontSize ?? Node.Defaults.fontSize
    node.fontColor = fontColor ?? Node.Defaults.fontColor
    node.label.lineHeight = lineHeight
    node.borderColor = borderColor ?? Node.Defaults.borderColor
    node.borderWidth = borderWidth ?? Node.Defaults.borderWidth
    node.color = color ?? Node.Defaults.color
    node.text = text
    node.padding = padding ?? Node.Defaults.padding
    
    if let selectedScale = selectedScale {
      node.selectedScale = selectedScale
    }
    
    if let deselectedScale = deselectedScale {
      node.deselectedScale = deselectedScale
    }
    
    if let animationDuration = animationDuration {
      node.animationDuration = TimeInterval(animationDuration)
    }
    
    if let selectedColor = selectedColor {
      node.selectedColor = selectedColor
    }
    
    if let selectedFontColor = selectedFontColor {
      node.selectedFontColor = selectedFontColor
    }
    
    if let radius = radius {
      node.update(radius: radius)
    }
  }
}

// MARK:- Setters
extension RNBubbleSelectNodeView {
  @objc func setId(_ id: String?) {
    self.id = id
  }
  
  @objc func setText(_ text: String?) {
    self.text = text
    updateNode()
  }
  
  @objc func setImage(_ image: UIImage?) {
    self.image = image
    updateNode()
  }
  
  @objc func setColor(_ color: UIColor?) {
    self.color = color
    updateNode()
  }
  
  @objc func setRadius(_ radius: CGFloat) {
    self.radius = radius
    updateNode()
  }
  
  @objc func setMarginScale(_ marginScale: CGFloat) {
    self.marginScale = marginScale
  }
  
  // Label Styling
  @objc func setFontSize(_ fontSize: CGFloat) {
    self.fontSize = fontSize
    updateNode()
  }
  
  @objc func setFontName(_ fontName: String?) {
    self.fontName = fontName
    updateNode()
  }
  
  @objc func setFontColor(_ fontColor: UIColor?) {
    self.fontColor = fontColor
    updateNode()
  }
  
  @objc func setLineHeight(_ lineHeight: CGFloat) {
    self.lineHeight = lineHeight
    updateNode()
  }
  
  @objc func setBorderColor(_ color: UIColor?) {
    self.borderColor = color
    updateNode()
  }
  
  @objc func setBorderWidth(_ width: CGFloat) {
    self.borderWidth = width
    updateNode()
  }
  
  @objc func setPadding(_ padding: CGFloat) {
    self.padding = padding
    updateNode()
  }
  
  @objc func setSelectedScale(_ selectedScale: CGFloat) {
    self.selectedScale = selectedScale
    updateNode()
  }
  
  @objc func setSelectedColor(_ selectedColor: UIColor?) {
    self.selectedColor = selectedColor
    updateNode()
  }
  
  @objc func setDeselectedScale(_ deselectedScale: CGFloat) {
    self.deselectedScale = deselectedScale
    updateNode()
  }
  
  @objc func setAnimationDuration(_ animationDuration: CGFloat) {
    self.animationDuration = animationDuration
    updateNode()
  }
  
  @objc func setSelectedFontColor(_ fontColor: UIColor?) {
    self.selectedFontColor = fontColor
    updateNode()
  }
}
