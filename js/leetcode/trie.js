function TrieNode (letter = null, isTerminal = false;) {
  this.letter = letter;
  this.children = {};
  this.isTerminal = isTerminal;
}

function Trie () {
  this.root = new TrieNode();
}

Trie.prototype.insert = function (word) {
  let curr = this.root;
  for (let i = 0; i < word.length; i++) {
    let letter = word[i];
    if (!curr.children.hasOwnProperty(letter)) {
      curr.children[letter] = new TrieNode(letter);
    }
    curr = curr.children[letter];
  }
  curr.isTerminal = true;
};

Trie.prototype.search = function (word) {
  let curr = this.root;
  for (let i = 0; i < word.length; i++) {
    let letter = word[i];
    if (!curr.children.hasOwnProperty(letter)) {
      return false;
    }
    curr = curr.children[letter];
  }
  return curr.isTerminal;
};

Trie.prototype.startswith = function (prefix) {
  let curr = this.root;
  for (let i = 0; i < prefix.length; i++) {
    let letter = prefix[i];
    if (!curr.children.hasOwnProperty(letter)) {
      return false;
    }
    curr = curr.children[letter];
  }
  return true;
};
