// --- Directions
// Given an integer, return an integer that is the reverse
// ordering of numbers.
// --- Examples
//   reverseInt(15) === 51
//   reverseInt(981) === 189
//   reverseInt(500) === 5
//   reverseInt(-15) === -51
//   reverseInt(-90) === -9

function reverseInt(n) {
  const negative = n < 0;
  const str = Math.abs(n).toString();
  const reverseStr = str.split('').reverse().join('');
  return negative ? -1 * parseInt(reverseStr) : parseInt(reverseStr);
}

module.exports = reverseInt;
