# Given an M x N matrix in which each row and each coloumn is sorted in ascending order, write a method to find an element.

# time: m + n?
# space: 1
def search_sorted_matrix(matrix, target)
  row = 0
  col = matrix[0].length - 1

  while row < matrix.length && col >= 0
    curr = matrix[row][col]
    if target == curr
      return true
    elsif target < curr
      col -= 1
    else
      row += 1
    end
  end

  false
end
