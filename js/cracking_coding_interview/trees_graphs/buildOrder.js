//You are give a list of projects and a list of dependencies (which is a list of pairs of projects, where the second project is dependent on the first project). All of a project's dependencies must be built before the project is. Find a build order that will allow the projects to be built. If there is no valid build order, return an error.

function buildOrder(projects, dependencies){
  const graph = {};
  dependencies.forEach(arr=>{
    [node1, node2] = arr;
    graph[node1] = graph[node1] || [];
    graph[node1].push(node2);
  })

  const ordered = [];
  const explored = new Set();
  graph.forEach((node, edges)=>{
    if (!explored.has(node)) {
      dfsVisit(node, graph, explored);
    }
  })
  return ordered;
}

function dfsVisit(node, graph, explored){
  explored.add(node);

  graph[node].forEach(outNode=>{
    if (!explored.has(outNode)) {
      dfsVisit(outNode, graph, explored)
    }
  })

  res.push(node);
}

// TODO: check for cycles
