function constructAlpha() {
  const alpha = [];
  const start = "a".charCodeAt();
  const end = "z".charCodeAt();
  for (let i = start; i <= end; i++) {
    alpha.push(String.fromCharCode(i));
  }
  return alpha;
}

function constructGraph(dictionary) {
  const LETTERS = constructAlpha();
  const graph = {};
  dictionary.forEach((word)=>{
    //remove
    for (let i = 0; i < word.length; i++) {
      let remove = word.slice(0, i).concat(word.slice(i + 1));
      if (dictionary.has(remove)) {
        graph[word] = graph[word] || [];
        graph[word].push(remove);
      }
      //change
      LETTERS.forEach((letter)=>{
        let change = word.slice(0, i).concat(letter).concat(word.slice(i + 1));
      }
      if (dictionary.has(change) && change !== word) {
        graph[word] = graph[word] || [];
        graph[word].push(change);
      }
    })
    //add
    for (let i = 0; i < word.length + 1; i++) {
      let add = word.slice(0, i).concat(letter).concat(word.slice(i));
      if (dictionary.has(add)) {
        graph[word] = graph[word] || [];
        graph[word].push(add);
      }
    }
  })
  return graph;
}

function transformWord(graph, start, goal){
  const queue = [start];
  const explored = new Set();
  const parents = { start: null };
  while (queue.length !== 0) {
    currWord = queue.shift();
    explored.add(currWord);
    if (currWord === goal) {
      break;
    }
    graph[currWord].forEach((adjacent)=>{
      if (!explored.has(adjacent)) {
        queue.push(adjacent);
        parents[adjacent] = currWord;
      }
    })
  }
  return reconstructPath(parents);
}

function reconstructPath(parents, goal) {
  const path = [];
  let currWord = goal;
  while (currWord !== null) {
    path.push(currWord);
    currWord = parents[currWord];
  }
  path.reverse();
  return path;
}
