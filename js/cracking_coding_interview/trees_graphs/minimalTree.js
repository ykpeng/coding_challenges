function minimalTree (arr, start, end) {
  if (end < start) {
    return null;
  }
  let mid = Math.floor((start + end) / 2);
  let node = new Node(arr[mid]);
  node.left = minimalTree(arr, start, mid - 1);
  node.right = minimalTree(arr, mid + 1, end);
  return node;
}
