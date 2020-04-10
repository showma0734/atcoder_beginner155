def valid?(n,arr)
  return false unless n.is_a?(Integer)
  return false unless arr.all?{|obj| obj.is_a?(String)}
  return false if n < 1 || n > 2*10**5
  return false if arr.any?{|str| str != str.downcase}
  return false if arr.any?{|str| str.upcase == str.downcase}
  return false if arr.any?{|str| str.size < 1 || str.size > 10}
  true
end

def poll(n, arr)
  return nil unless valid?(n, arr)
  cnt = Hash.new(0)
  arr.each{|a| cnt[a] += 1}
  max_cnt = cnt.values.max
  cnt.select{|k, v| v == max_cnt}.keys.sort
end

#test

puts poll(7, ["beat", "vet", "beet", "bed", "vet", "bet", "beet"]) == ["beet", "vet"]
puts poll(8, ["buffalo"] * 8) == ["buffalo"]
puts poll(1, ["aaa"]) == ["aaa"]
puts poll(0, [nil]) == nil
puts poll(2*10**5, ["aaa"]*2*10**5) == ["aaa"]
puts poll(2*11**5, ["aaa"]*2*11**5) == nil
puts poll(1, ["a"]) == ["a"]
puts poll(1, [""]) == nil
puts poll(1, ["a"*10]) == ["a"*10]
puts poll(1, ["a"*11]) == nil
puts poll("a", "a") == nil
puts poll(1, [1]) == nil
puts poll(1, ["1"]) == nil

#all true

