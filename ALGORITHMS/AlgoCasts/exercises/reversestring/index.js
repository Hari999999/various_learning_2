// --- Directions
// Given a string, return a new string with the reversed
// order of characters
// --- Examples
//   reverse('apple') === 'leppa'
//   reverse('hello') === 'olleh'
//   reverse('Greetings!') === '!sgniteerG'

function reverse(str) {
  return str.split('').reverse().join('');

  // const characters = str.split('');
  // let reversed = '';

  // for (character of characters) {
  //   reversed = character + reversed;
  // }

  // return reversed;
}

module.exports = reverse;
