// Implement a function that would give you the longest incrementing path in a 2d array. You can only move to adjacent values (not diagonally).

function longestIncrementingPath(arr) {
  const DIRS = [[0, 1],
                [0, -1],
                [-1, 0],
                [1, 0]];

  const exploring = [arr[0][0]];
  const seen = {};
  const parent = {};

  while (exploring.length !== 0) {
    let i, j = currPos = exploring.shift();
    let currVal = arr[i][j];

    DIRS.forEach((dir)=>{
      let x, y = dir;
      let newI, newJ = [i + x, j + y];
      let pos = [newI, newJ];
      let val = arr[newI][newJ];

      if (!seen.has(pos) && val > currVal) {
        exploring.push(pos);
        parent[pos] = currPos;
      }
    })

    seen[currPos] = true;
  }


}

// How do you reverse a string in place
function reverse(str){
  const split = str.split("");
  const len = str.length;
  for (let i = 0; i < Math.floor(len / 2); i++) {
    // [split[i], split[len - 1 - i]] = [split[len - 1 - i], split[i]];
    let temp = split[i];
    split[i] = split[len - 1 - i];
    split[len - 1 - i] = temp;
  }
  return split.join("");
}

console.log(reverse("01234"));

// Using a shared coding pad to write an HTML/Javascript UI widget. Heavy emphasis on using jQuery to perform DOM manipulation.

// 1) Design a reconciliation system for trades booked in a day
// 2) Given an array, find first instance of local maxima ( greater than both the left and right elements in an array )

function localMaxima (arr){
  for (let i = 1; i < arr.length - 1; i++) {
    if (arr[i] > arr[i - 1] && arr[i] > arr[i + 1]) {
      return arr[i];
    }
  }
  return null;
}

// In an array you have all the numbers from 1 through n (not in order) with one number missing. Find that number.
// Now, you have two numbers missing. Find both the numbers.
// Notes: O(n) time solution, O(1) extra space. n may be very large, so beware of overflows!

function findMissing(arr, n) {
  const nums = new Array(n + 1).fill(false);

  for (let i = 0; i < arr.length; i++) {
    nums[arr[i]] = true;
  }

  const missing = [];
  for (let i = 1; i <= n; i++) {
    if (!nums[i]) {
      missing.push(i);
    }
  }

  return missing;
}

console.log(findMissing([5,3,4,1,2,8], 9));

// Given n competitors, what is the minimum match to decide winners ?

// Deep copy of a linked list, with an extra pointer to a random node.

// Link children of BST to siblings

// How many comparisons do you need to find the largest integer in a list of N numbers? How can you possibly interpret/ justify that?
