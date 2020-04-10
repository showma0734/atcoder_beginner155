def valid?(n, arr)
  return false unless n.is_a?(Integer)
  return false unless arr.is_a?(Array)
  return false unless arr.all?{|obj| obj.is_a?(Integer)}
  return false if n < 1 || n > 100
  return false if arr.all?{|num| num < 1 || num > 1000}
  return false if n != arr.size
  true 
end

def papers(n, arr)
  return nil unless valid?(n, arr)
  evens = arr.select{|num| num.even?}
  return "DENIED" if evens.size == 0
  return "APPROVED" if evens.all?{|e| e % 3 == 0} || evens.all?{|e| e % 5 == 0}
  return "APPROVED" if evens.any?{|e| e % 3 == 0} && evens.any?{|e| e % 5 == 0}
  "DENIED"
end

#test
puts papers(5, [6, 7, 9, 10, 31]) == "APPROVED"
puts papers(3, [28, 27, 24]) == "DENIED"
puts papers(1, [3]) == "DENIED"
puts papers(0, [nil]) == nil
puts papers(100, [1] * 100) == "DENIED"
puts papers(101, [1] * 101) == nil
puts papers(1, [1000]) == "APPROVED"
puts papers(1, [1001]) == nil
puts papers("a", [1]) == nil
puts papers(2, ["a", 10]) == nil
puts papers(1, [3, 6, 10]) == nil

#all true