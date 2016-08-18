function routeBetweenNodes(graph, node1, node2){
  let visited = new Set();
  let visiting = new Set();
  let queue = [node1];
  while (queue.length !== 0) {
    let curr = queue.shift();
    if (curr === node2) {
      return true;
    }
    graph[curr].forEach((node) => {
      if (!visited.has(node) && !visting.has(node)) {
        queue.push(node);
        visiting.add(node);
      }
    })
    visiting.delete(curr);
    visited.add(curr);
  }
  return false;
}
