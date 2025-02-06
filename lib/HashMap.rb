require './lib/LinkedList.rb'

class HashMap
  def intialize(load, capacity)
    @load = load
    @capacity = capacity
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  def set(key, value)
    current_bucket = @storage[hash(key)]
    if current_bucket.find
  end
end