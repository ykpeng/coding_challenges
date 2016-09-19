function jsonStringify(arg){
  if (typeof arg === 'number' || typeof arg === 'boolean' || arg === null) {
    return '' + arg;
  } else if (typeof arg === 'string') {
    return '"' + arg + '"';
  } else if (Array.isArray(arg)) {
    const arrVals = [];
    arg.forEach(el => {
      arrVals.push(jsonStringify(el));
    })
    return '[' + arrVals.join(",") + ']';
  } else if (arg instanceof Object) {
    let objRes = [];
    for (let key in arg) {
      if (arg.hasOwnProperty(key)) {
        keyVal = jsonStringify(key) + ":";
        if (arg === undefined) {
          keyVal += "null";
        } else {
          keyVal += jsonStringify(arg[key]);
        }
        objRes.push(keyVal);
      }
    }
    return '{' + objRes.join(",") +'}';
  }
};

console.log(jsonStringify({
  x: [10, undefined, function(){}, Symbol('')]
}));
