import React from 'react';
import { BubbleNode, BubbleProps } from './Bubble';
import { NativeSyntheticEvent, requireNativeComponent } from 'react-native';

const RNBubbleSelect = requireNativeComponent('RNBubbleSelectView');

export type BubbleSelectProps = Omit<BubbleProps, 'text' | 'id'> & {
  onSelect?: (bubble: BubbleNode) => void;
  onDeselect?: (bubble: BubbleNode) => void;
  bubbleSize?: number;
  allowsMultipleSelection?: boolean;
  children: React.ReactNode;
  style?: object;
  width?: number;
  height?: number;
};

const BubbleSelect = ({
  onSelect,
  onDeselect,
  style,
  allowsMultipleSelection,
  children,
  bubbleSize,
  width = 200,
  height = 200,
  ...bubbleProps
}: BubbleSelectProps) => {
  const defaultStyle = {
    flex: 1,
    width,
    height,
  };

  const handleSelect = (event: NativeSyntheticEvent<BubbleNode>) => {
    console.log(event);
    if (onSelect) {
      onSelect(event.nativeEvent);
    }
  };

  const handleDeselect = (event: NativeSyntheticEvent<BubbleNode>) => {
    if (onDeselect) {
      onDeselect(event.nativeEvent);
    }
  };

  return (
    <RNBubbleSelect
      style={[defaultStyle, style]}
      allowsMultipleSelection={allowsMultipleSelection}
      onSelect={handleSelect}
      onDeselect={handleDeselect}
      bubbleSize={bubbleSize}
    >
      {React.Children.map(children, (child: any) =>
        React.cloneElement(child, bubbleProps)
      )}
    </RNBubbleSelect>
  );
};

export default BubbleSelect;
