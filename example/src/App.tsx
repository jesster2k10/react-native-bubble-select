import * as React from 'react';
import {
  StyleSheet,
  View,
  Text,
  SafeAreaView,
  Dimensions,
  Button,
  Alert,
} from 'react-native';
import BubbleSelect, { Bubble, BubbleNode } from 'react-native-bubble-select';

const { width, height } = Dimensions.get('window');

function randomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}

export default function App() {
  const initialBubbles = [{ id: '1', text: 'Hello', radius: 35 }];
  const [bubbles, setBubbles] = React.useState(initialBubbles);

  const addBubble = () => {
    const id = bubbles.length + 1;
    const newBubble = {
      id: `${id}`,
      text: `Hello ${id}`,
      radius: Math.floor(Math.random() * 55) + 30,
      color: randomColor(),
    };
    setBubbles([...bubbles, newBubble]);
  };

  const handleSelect = (bubble: BubbleNode) => {
    Alert.alert(`Selected bubble: ${bubble.text} with id: ${bubble.id}`);
  };

  const handleDeselect = (bubble: BubbleNode) => {
    Alert.alert(`Deselected bubble: ${bubble.text} with id: ${bubble.id}`);
  };

  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.container}>
        <View style={styles.header}>
          <Text style={styles.title}>Bubble Select Demo</Text>
          <Button title="Add Bubble" onPress={addBubble} />
        </View>
        <BubbleSelect
          onSelect={handleSelect}
          onDeselect={handleDeselect}
          width={width}
          height={height}
        >
          {bubbles.map(bubble => (
            <Bubble
              key={bubble.id}
              id={bubble.id}
              text={bubble.text}
              radius={bubble.radius}
              color={randomColor()}
            />
          ))}
        </BubbleSelect>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
  },
  container: {
    flex: 1,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingLeft: 15,
    paddingRight: 15,
    paddingTop: 15,
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
  },
});
