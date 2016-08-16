require 'set'

def uniq_subs(str)
  uniqs = Set.new()

  (0...str.length).each do |i|
    (i + 1..str.length).each do |j|
      uniqs << str[i...j]
    end
  end

  uniqs
end

p uniq_subs("bobobobob")
