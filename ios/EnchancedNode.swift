//
//  EnchancedNode.swift
//  DoubleConversion
//
//  Created by Jesse Onolememen on 30/03/2020.
//

import Foundation
import SpriteKit
import UIKit
import Magnetic

class EnchancedNode: Node {
  open var id: String?
  
  open var selectedScale: CGFloat = 4/3
  open var deselectedScale: CGFloat = 1
  open var animationDuration: TimeInterval = 0.2
  open var selectedColor: UIColor?
  open var selectedFontColor: UIColor?
  open var originalColor: UIColor = Defaults.Color
  open var originalFontColor: UIColor = Defaults.FontColor
  
  open var padding: CGFloat = 20 {
    didSet {
      resize()
    }
  }

  open var marginScale: CGFloat = 1.01 {
    didSet {
      guard let path = path else { return }
      reneratePhysicsBody(withPath: path)
    }
  }
  
  open private(set) var radius: CGFloat?
  
  open var fontName: String {
    get { label.fontName ?? Defaults.FontName }
    set {
      label.fontName = newValue
      resize()
    }
  }
  
  open var fontSize: CGFloat {
    get { label.fontSize }
    set {
      label.fontSize = newValue
      resize()
    }
  }
  
  open var fontColor: UIColor {
    get { label.fontColor ?? Defaults.FontColor }
    set { label.fontColor = newValue }
  }
  
  open var borderColor: UIColor {
    get { strokeColor }
    set { strokeColor = newValue }
  }
  
  open var borderWidth: CGFloat {
    get { lineWidth }
    set {
      lineWidth = newValue
      resize()
    }
  }
  
  override var text: String? {
    didSet {
      resize()
    }
  }
  
  struct Defaults {
    static let FontName = "Avenir-Medium"
    static let FontColor = UIColor.white
    static let FontSize = CGFloat(13)
    static let BorderWidth = CGFloat(0)
    static let BorderColor = UIColor.clear
    static let Color = UIColor.black
    static let Padding = CGFloat(20)
    static let Radius = CGFloat(30)
  }
  
  public func update(radius: CGFloat, labelWidth width: CGFloat? = nil) {
    guard let path = SKShapeNode(circleOfRadius: radius).path else { return }
    self.path = path
    self.label.width = width ?? radius
    self.radius = radius
    reneratePhysicsBody(withPath: path)
  }
  
  public func resize() {
    if (radius != nil) {
      return
    }
    
    if let text = text, let font = UIFont(name: fontName, size: fontSize) {
      let fontAttributes = [NSAttributedString.Key.font: font]
      let size = (text as NSString).size(withAttributes: fontAttributes)
      let radius = size.width / 2 + CGFloat(self.padding)
      update(radius: radius, labelWidth: size.width)
    }
  }
  
  private func reneratePhysicsBody(withPath path: CGPath) {
    self.physicsBody = {
      var transform = CGAffineTransform.identity.scaledBy(x: marginScale, y: marginScale)
      let body = SKPhysicsBody(polygonFrom: path.copy(using: &transform)!)
      body.allowsRotation = false
      body.friction = 0
      body.linearDamping = 3
      return body
    }()
  }
  
  override func selectedAnimation() {
    originalColor = fillColor
    originalFontColor = fontColor
    
    let scaleAction = SKAction.scale(to: selectedScale, duration: animationDuration)

    if let selectedFontColor = selectedFontColor {
      print("Change font!")
      label.run(.colorTransition(from: originalFontColor, to: selectedFontColor, duration: animationDuration))
    }
    
    if let selectedColor = selectedColor {
      run(.group([
        scaleAction,
        .colorTransition(from: originalColor, to: selectedColor, duration: animationDuration)
      ]))
    } else {
      run(scaleAction)
      
      if let texture = texture {
        fillTexture = texture
      }
    }
  }
  
  override func deselectedAnimation() {
    let scaleAction = SKAction.scale(to: 1, duration: 0.2)
    
    if let selectedColor = selectedColor {
      run(.group([
        scaleAction,
        .colorTransition(from: selectedColor, to: originalColor, duration: animationDuration)
      ]))
    } else {
      run(scaleAction)
    }
    
    if let selectedFontColor = selectedFontColor {
      label.run(.colorTransition(from: selectedFontColor, to: originalFontColor, duration: animationDuration))
    }
    
  }
}
