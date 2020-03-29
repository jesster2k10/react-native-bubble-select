import { NativeModules } from 'react-native';

type BubbleSelectType = {
  getDeviceName(): Promise<string>;
};

const { BubbleSelect } = NativeModules;

export default BubbleSelect as BubbleSelectType;
