import * as React from 'react';
import {
  StyleSheet,
  View,
  Text,
  SafeAreaView,
  Button,
  Platform,
  Dimensions,
} from 'react-native';
import BubbleSelect, { Bubble, BubbleNode } from 'react-native-bubble-select';
import randomCity, { randomCities } from './randomCity';

const { width, height } = Dimensions.get('window');

export default function App() {
  const [cities, setCities] = React.useState<any[]>(randomCities());
  const [force, setForce] = React.useState(false);
  const [selectedCites, setSelectedCities] = React.useState<BubbleNode[]>([]);
  const [removedCities, setRemovedCities] = React.useState<BubbleNode[]>([]);

  React.useEffect(() => {
    if (force) {
      setCities(randomCities());
    }
  }, [force]);

  React.useEffect(() => {
    setForce(true);
  }, []);

  const addCity = () => {
    setCities([...cities, randomCity()]);
  };

  const handleSelect = (bubble: BubbleNode) => {
    setSelectedCities([...selectedCites, bubble]);
  };

  const handleDeselect = (bubble: BubbleNode) => {
    setSelectedCities(selectedCites.filter(({ id }) => id !== bubble.id));
  };

  const handleRemove = (bubble: BubbleNode) => {
    setRemovedCities([...removedCities, bubble]);
  };

  const handleReset = () => {
    setCities([]);
  };

  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.container}>
        <View style={styles.header}>
          <Text style={styles.title}>Discover New Cities</Text>
          <Text style={styles.message}>
            Tap on the places you love, hold on the places you don't.
          </Text>
          {selectedCites.length > 0 ? (
            <Text style={styles.selectedCity}>
              Selected: {selectedCites.map(city => city.text).join(', ')}
            </Text>
          ) : null}
          {removedCities.length > 0 ? (
            <Text style={styles.selectedCity}>
              Removed: {removedCities.map(city => city.text).join(', ')}
            </Text>
          ) : null}
        </View>
        <BubbleSelect
          onSelect={handleSelect}
          onDeselect={handleDeselect}
          onRemove={handleRemove}
          width={width}
          height={height}
          fontName={Platform.select({
            ios: 'SinhalaSangamMN-Bold',
          })}
          fontSize={16}
        >
          {cities.map(city => (
            <Bubble
              key={city.id}
              id={city.id}
              text={city.text}
              color={city.color}
              selectedColor={city.selectedColor}
              selectedScale={city.selectedScale}
            />
          ))}
        </BubbleSelect>
        <View style={styles.footer}>
          <Button title="Reset" onPress={handleReset} />
          <Button title="Add" onPress={addCity} />
        </View>
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
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingTop: 45,
  },
  title: {
    fontSize: 30,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 10,
  },
  footer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingLeft: 50,
    paddingRight: 50,
  },
  message: {},
  selectedCity: {
    marginTop: 15,
    fontSize: 12,
    maxWidth: '80%',
    textAlign: 'center',
  },
});
