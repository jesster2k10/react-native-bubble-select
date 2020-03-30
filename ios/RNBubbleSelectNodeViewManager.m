//
//  RNBubbleSelectNodeViewManager.m
//  react-native-bubble-select
//
//  Created by Jesse Onolememen on 29/03/2020.
//

#import <Foundation/Foundation.h>
#import <React/RCTUIManager.h>

@interface RCT_EXTERN_MODULE(RNBubbleSelectNodeViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(id, NSString)
RCT_EXPORT_VIEW_PROPERTY(text, NSString)
RCT_EXPORT_VIEW_PROPERTY(image, UIImage)
RCT_EXPORT_VIEW_PROPERTY(color, UIColor)
RCT_EXPORT_VIEW_PROPERTY(radius, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(marginScale, CGFloat)

RCT_EXPORT_VIEW_PROPERTY(fontSize, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(fontColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(fontName, NSString)
RCT_EXPORT_VIEW_PROPERTY(lineHeight, CGFloat)

RCT_EXPORT_VIEW_PROPERTY(borderColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(borderWidth, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(padding, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(selectedScale, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(deselectedScale, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(animationDuration, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(selectedColor, UIColor)

@end
