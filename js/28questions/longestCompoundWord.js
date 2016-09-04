function longestCompoundWord (words) {
  let trie = new Trie();
  let queue = [];
  words.forEach(word =>{
    let prefixes = trie.getAllPrefixesOfWord(word);
    prefixes.forEach(prefix => {
      queue.push([word, word.slice(prefix.length)])
    })
    trie.insert(word);
  })

  let longestWord = "";
  let maxLength = 0;
  while (queue) {
    let last = queue.shift();
    let word = last[0];
    let suffic = last[1];

    if (trie.includes(suffix) && word.length > maxLength) {
      longestWord = word;
      maxLength = word.length;
    } else {
      prefixes = trie.getAllPrefixesOfWord(suffix);
      prefixes.forEach(prefix => {
        queue.append([word, suffix.slice(prefix.length)]);
      })
    }
  }
  return longestWord;
}

function Node (letter = null, isTerminal = false) {
  this.letter = letter;
  this.children = {};
  this.isTerminal = isTerminal;
}

function Trie () {
  this.root = new Node();
}

Trie.prototype.includes = function (word) {
  let curr = this.root;
  for (let i = 0; i < word.length; i++) {
    let char = word[i];
    if (!curr.children.hasOwnProperty(char)) {
      return false;
    }
    curr = curr.children[char];
  }
  return curr.isTerminal;
};

Trie.prototype.insert = function (word) {
  let curr = this.root;
  for (let i = 0; i < word.length; i++) {
    let char = word[i];
    if (!curr.children.hasOwnProperty(char)) {
      curr.children[char] = new Node(char);
    }
    curr = curr.children[char];
  }
  curr.isTerminal = True;
};

Trie.prototype.getAllPrefixesOfWord = function (word) {
  let prefix = "";
  let prefixes = [];
  let curr = this.root;
  for (let i = 0; i < word.length; i++) {
    let char = word[i];
    if (!curr.children.hasOwnProperty(char)) {
      return prefixes;
    }
    curr = curr.children[char];
    prefix += char;
    if (curr.isTerminal) {
      prefixes.append(prefix);
    }
  }
  return prefixes;
};
