function productify(nums){
  let products = new Array(nums.length).fill(1);
  let beforeProd = 1;
  for (let i = 0; i < nums.length; i++) {
    products[i] *= beforeProd;
    beforeProd *= nums[i]
  }
  let afterProd = 1;
  for (let i = nums.length - 1; i >= 0; i--) {
    products[i] *= afterProd;
    afterProd *= nums[i];
  }
  return products;
}

console.log(productify([1, 2, 6, 5, 9]));
