import cities from './cities.json';
import randomColor from './randomColor';

export default function randomCity() {
  const { city } = cities[Math.floor(Math.random() * cities.length)];
  return {
    id: city,
    text: city,
    color: randomColor(),
    selectedColor: randomColor(),
    selectedScale: Math.floor(Math.random() * 1.5) + 1.2,
  };
}

export function randomCities() {
  return [...Array(15).keys()].map(randomCity);
}
