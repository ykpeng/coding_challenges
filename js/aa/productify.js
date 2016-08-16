function productify(nums) {
  const products = [];

  for (let i = 0; i < nums.length; i++) {
    products.push(1);
  }

  let lower_prod = 1;
  for (let i = 0; i < nums.length; i++) {
    products[i] *= lower_prod;
    lower_prod *= nums[i];
  }

  let upper_prod = 1;
  for (let j = nums.length - 1; j >= 0; j--) {
    products[j] *= upper_prod;
    upper_prod *= nums[j];
  }

  return products;
}

let nums = [1,2,3,4,5]
console.log(productify(nums));
