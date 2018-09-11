// --- Directions
// Given a string, return the character that is most
// commonly used in the string.
// --- Examples
// maxChar("abcccccccd") === "c"
// maxChar("apple 1231111") === "1"

function maxChar(str) {
  const arr = str.split('');
  let obj = {};
  let maxKey = '';
  let maxValue = 0;

  for (val of arr) {
    obj[val] = obj[val] ? obj[val] + 1 : 1;
  }

  for (var key in obj) {
    if (obj.hasOwnProperty(key)) {
      if (maxValue < obj[key]) {
        maxKey = key;
        maxValue = obj[key]
      }
    }
  }

  return maxKey;
}

module.exports = maxChar;
