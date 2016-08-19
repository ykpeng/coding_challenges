function createLevelLinkedList (root, lists, level) {
  if (root === null) {
    return;
  }

  let list = null;
  if (lists.length === level) {
    list = new List();
    lists.push(list);
  } else {
    list = lists[level];
  }
  list.add(root);

  createLevelLinkedList(root.left, lists, level + 1);
  createLevelLinkedList(root.right, lists, level + 1);
}

createLevelLinkedList(root, [], 0);
console.log(lists);

function createLevelLinkedList2 (root) {
  let res = [];
  let curr = new List();
  if (root !== null) {
    curr.add(root);
  }
  while (curr.length > 0) {
    res.push(curr);
    let parents = curr;
    curr = new List();
    let parent = parents.head;
    while (parent !== null) {
      if (parent.left !== null) {
        curr.add(parent.left);
      }
      if (parent.right !== null) {
        curr.add(parent.right);
      }
      parent = parent.next;
    }
  }
  return res;
}
