def silly_years(year)
  years = []
  curr_year = year + 1
  while years.length < 10
    year_s = curr_year.to_s

    left, right, mid = [year_s[0..1], year_s[2..3], year_s[1..2]].map(&:to_i)

    years << curr_year if left + right == mid

    curr_year += 1
  end

  years
end

p silly_years(1989)
