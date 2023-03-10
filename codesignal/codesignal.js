//1. add

function add(param1, param2) {
  return param1 + param2;
}

//2. centuryFromYear
function centuryFromYear(year) {
  return Math.ceil(year / 100);
}

//3. checkPalindrome

function checkPalindrome(inputString) {
  const len = inputString.length;

  // Use for loop to divide the words into 2 half
  for (let i = 0; i < len / 2; i++) {
    // validate the first and last characters are same
    if (inputString[i] !== inputString[len - 1 - i]) {
      return false;
    }
  }
  return true;
}

//4. adjacentElementsProduct

function adjacentElementsProduct(inputArray) {
  var arr = inputArray;
  var x = 0;
  var y = 0;
  var p = -Infinity;
  for (var i = 0; i < arr.length; i++) {
    x = arr[i];
    y = arr[i + 1];
    if (x * y > p) {
      p = x * y;
    }
  }
  return p;
}

//5. shapeArea
function shapeArea(n) {
  if (n < 0) {
    return false;
  }
  return n * n + (n - 1) * (n - 1);
}
