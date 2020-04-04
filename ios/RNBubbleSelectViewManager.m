//
//  RNBubbleSelectViewManager.m
//  react-native-bubble-select
//
//  Created by Jesse Onolememen on 29/03/2020.
//

#import <Foundation/Foundation.h>
#import <React/RCTUIManager.h>
#import <UIKit/UIKit.h>

@interface RCT_EXTERN_MODULE(RNBubbleSelectViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(onSelect, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onDeselect, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onRemove, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(allowsMultipleSelection, BOOL)
RCT_EXPORT_VIEW_PROPERTY(longPressDuration, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(removeNodeOnLongPress, BOOL)
RCT_EXPORT_VIEW_PROPERTY(magneticBackgroundColor, UIColor)

@end
