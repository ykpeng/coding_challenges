def matrix_region_sum(matrix, top_left_coords, bottom_right_coords)
  sum = 0

  (top_left_coords[0]..bottom_right_coords[0]).each do |i|
    (top_left_coords[1]..bottom_right_coords[1]).each do |j|
      sum += matrix[i][j]
    end
  end

  sum
end
