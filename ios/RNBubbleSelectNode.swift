//
//  MagneticNode.swift
//  BubbleSelect
//
//  Created by Jesse Onolememen on 29/03/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import UIKit
import Magnetic

extension Node {
  private struct AssociatedKeys {
      static var id = "id"
  }
  
  var id: String? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.id) as? String
    }
    
    set(value) {
      objc_setAssociatedObject(self, &AssociatedKeys.id, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
}

class RNBubbleSelectNodeView: UIView {
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
  
  lazy var node: Node = {
    let node = Node(
      text: text,
      image: image,
      color: color ?? .black,
      radius: radius ?? 30,
      marginScale: marginScale ?? 1.0
    )
    node.id = id
    node.label.fontName = fontName ?? "AvenirNext-Medium"
    node.label.fontSize = fontSize ?? 13
    node.label.fontColor = fontColor
    node.label.lineHeight = lineHeight
    return node
  }()
}

// MARK:- Setters
extension RNBubbleSelectNodeView {
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
  
  // Label Styling
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
