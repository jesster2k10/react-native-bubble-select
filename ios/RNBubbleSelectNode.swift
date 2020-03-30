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
import SpriteKit

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
  var padding: CGFloat?
  
  // Label Styling
  var fontName: String?
  var fontSize: CGFloat?
  var fontColor: UIColor?
  var lineHeight: CGFloat?
  var borderColor: UIColor?
  var borderWidth: CGFloat?
  
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
    node.label.fontName = fontName ?? "AvenirNext-Medium"
    node.label.fontSize = fontSize ?? 13
    node.label.fontColor = fontColor ?? .white
    node.label.lineHeight = lineHeight
    node.strokeColor = borderColor ?? .black
    node.lineWidth = borderWidth ?? 0
    node.color = color ?? .black
    node.text = text
    
    if let radius = radius {
      set(radius: radius)
    }
  }
  
  private func set(radius: CGFloat, width: CGFloat? = nil) {
    guard let path = SKShapeNode(circleOfRadius: radius).path else { return }
    node.path = path
    node.label.width = width ?? radius
    node.physicsBody = {
      let marginScale = CGFloat(self.marginScale ?? 1.01)
      var transform = CGAffineTransform.identity.scaledBy(x: marginScale, y: marginScale)
      let body = SKPhysicsBody(polygonFrom: path.copy(using: &transform)!)
        body.allowsRotation = false
        body.friction = 0
        body.linearDamping = 3
        return body
    }()
  }
 
  private func resizeBubble() {
    let defaultFontName = fontName ?? "AvenirNext-Medium"
    let defaultFontSize = fontSize ?? 13
  
    if (radius != nil) {
      return
    }
    
    if let text = text, let font = UIFont(name: defaultFontName, size: defaultFontSize) {
      let fontAttributes = [NSAttributedString.Key.font: font]
      let size = (text as NSString).size(withAttributes: fontAttributes)
      let padding = self.padding ?? 20
      let radius = size.width / 2 + CGFloat(padding)
      set(radius: radius, width: size.width)
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
    resizeBubble()
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
    resizeBubble()
  }
  
  @objc func setFontName(_ fontName: String?) {
    self.fontName = fontName
    updateNode()
    resizeBubble()
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
  }
}
