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
