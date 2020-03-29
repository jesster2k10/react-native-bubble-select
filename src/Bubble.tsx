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
