# Imagine a robot sitting in on the upper left corner of grid with r rows and c columns. The robot can only move in two directions, right and down, but certain cells are "off limits" such that the robto cannot step on them. Design an algorithm to find a path for the robot from the top left to the bottom right.

require 'set'
def can_find_path(invalid_pos, r, c)
  if r < 0 || c < 0 || invalid_pos.include?([r, c])
    return false
  end

  if r, c == 0, 0
    return true
  end

  can_find_path(invalid_pos, r - 1, c) || can_find_path(invalid_pos, r, c - 1)
end

# time: 2^(r+c)
# space: r or c
def find_path(invalid_pos, r, c)
  if r < 0 || c < 0 || invalid_pos.include?([r, c])
    return false
  end

  if r, c == 0, 0
    return [[r, c]]
  end

  path_step_down = find_path(invalid_pos, r - 1, c)
  path_step_right = find_path(invalid_pos, r, c - 1)

  if path_step_down
    path_step_down << [r, c]
  elsif path_step_right
    path_step_right << [r, c]
  else
    false
  end
end

# time: rc
# space: r or c
def find_path2(invalid_pos, r, c, memo = {})
  if r < 0 || c < 0 || invalid_pos.include?([r, c])
    return false
  end

  if r, c == 0, 0
    return [[r, c]]
  end

  if !memo[[r, c]].nil?
    return memo[[r, c]]
  end

  path_step_down = find_path2(invalid_pos, r - 1, c, memo)
  if !path_step_down
    path_step_right = find_path2(invalid_pos, r, c - 1, memo)
  end

  if path_step_down
    path_step_down << [r, c]
    memo[[r, c]] = path_step_down
  elsif path_step_right
    path_step_right << [r, c]
    memo[[r, c]] = path_step_right
  else
    memp[[r, c]] = false
  end

  memo[[r, c]]
end

def find_path3(invalid_pos, r, c, path, failed_pos = Set.new())
  if r < 0 || c < 0 || invalid_pos.include?([r, c])
    return false
  end

  if failed_pos.include?([r, c])
    return false
  end
  
  if r, c == 0, 0 || find_path3(invalid_pos, r - 1, c, path, failed_pos) || find_path3(invalid_pos, r, c - 1, path, failed_pos)
    path << [r, c]
    true
  else
    failed_pos << [r, c]
    false
  end
end
