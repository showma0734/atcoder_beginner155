def valid?(a, b, c)
  return false unless [a, b, c].all?{|obj| obj.is_a?(Integer)}
  return false if [a, b, c].any?{|num| num < 1 || num > 9}
  true
end

def poor(a, b, c)
  return nil unless valid?(a, b, c)
  return "NO" if a == b && a == c
  a == b || b == c || a == c ? "YES" : "NO"
end

#test
puts poor(5, 7, 5) == "YES"
puts poor(4, 4, 4) == "NO"
puts poor(0, 3, 3) == nil
puts poor(1, 3, 3) == "YES"
puts poor(10, 3, 3) == nil
puts poor(9, 3, 3) == "YES"
puts poor("a", 1, 1) == nil

#all true