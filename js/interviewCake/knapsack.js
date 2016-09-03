function knapsack(cakeTypes, weightCapacity){
  const maxValuesAtCapacities = [];
  for (let i = 0; i < weightCapacity; i++) {
    maxValuesAtCapacities[i] = 0;
  }

  for (let currentCapacity = 0; currentCapacity <= weightCapacity; currentCapacity++) {
    let currentMaxValue = 0;
    for (var j = 0; j < cakeTypes.length; j++) {
      let cakeType = cakeTypes[j];

      if (cakeType.weight === 0 && cakeType.value !== 0) {
        return Infinity;
      }
    }

    if (cakeType.weight <= currentCapacity) {
      let maxValueUsingCake = cakeType.value + maxValuesAtCapacities[currentCapacity - cakeType.weight];
      currentMaxValue = Math.max(maxValueUsingCake, currentMaxValue);
    }

    maxValuesAtCapacities[currentCapacity] = currentMaxValue;
  }

  return maxValuesAtCapacities[weightCapacity];
}
