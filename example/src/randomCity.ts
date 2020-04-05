import cities from './cities.json';
import randomColor from './randomColor';
import { Platform } from 'react-native';

let i = 0;

export default function randomCity() {
  const { city } = cities[Math.floor(Math.random() * cities.length)];
  i += 1;
  let color = {};

  // assign a gradient to odd items
  if (i % 2 === 0) {
    color = {
      gradient: {
        startColor: randomColor(),
        endColor: randomColor(),
        direction: 'vertical',
      },
    };
  } else {
    color = {
      color: randomColor(),
    };
  }

  return Platform.select({
    ios: {
      id: `${city}--${i}`,
      text: city,
      color: randomColor(),
      selectedColor: randomColor(),
      selectedScale: Math.floor(Math.random() * 1.5) + 1.2,
    },
    android: {
      id: `${city}--${i}`,
      text: city,
      ...color,
    },
  });
}

export function randomCities() {
  return [...Array(15).keys()].map(randomCity);
}
