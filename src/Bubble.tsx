import React from 'react';
import { requireNativeComponent, Platform } from 'react-native';

const RNBubble = requireNativeComponent('RNBubbleSelectNodeView');

export interface BubbleNode {
  text: string;
  id: string;
}

export type BubbleProps = BubbleNode & {
  color?: string;
  radius?: number;
  marginScale?: number;
  fontName?: string;
  fontSize?: number;
  fontColor?: string;
  fontStyle?: 'bold' | 'bold-italic' | 'normal';
  lineHeight?: number;
  borderColor?: string;
  borderWidth?: number;
  padding?: number;
  selectedScale?: number;
  deselectedScale?: number;
  animationDuration?: number;
  selectedColor?: string;
  selectedFontColor?: string;
  autoSize?: boolean;
};

const Bubble = ({
  text,
  color,
  radius,
  marginScale,
  id,
  fontName,
  fontSize,
  fontColor,
  lineHeight,
  fontStyle,
  padding,
  borderColor,
  borderWidth,
  selectedScale,
  deselectedScale,
  selectedColor,
  animationDuration,
  selectedFontColor,
  autoSize,
}: BubbleProps) => {
  const props = Platform.select({
    ios: {
      text,
      color,
      radius,
      marginScale,
      id,
      fontName,
      fontSize,
      fontColor,
      lineHeight,
      padding,
      borderColor,
      borderWidth,
      selectedScale,
      deselectedScale,
      animationDuration,
      selectedColor,
      selectedFontColor,
      autoSize,
    },
    android: {
      text,
      color,
      id,
      fontName,
      fontSize,
      fontColor,
      fontStyle,
    },
  });

  return <RNBubble {...props} />;
};

export default Bubble;
