//yx is substring of xyxy
function isRotation (str1, str2) {
  const length = str1.length;
  if (length === str2.length && length !== 0) {
    const longStr = str1.concat(str1);
    return isSubstring(longStr, str2);
  }
  return false;
}
