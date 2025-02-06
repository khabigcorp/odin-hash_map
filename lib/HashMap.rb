require './lib/LinkedList.rb'
require './lib/Node.rb'
class HashMap
  def intialize(load, capacity)
    @load = load
    @capacity = capacity
    @storage = Array.new(capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  def set(key, value)
    current_bucket = @storage[hash(key) % capacity]
    if current_bucket.contains?(key)
      current_bucket.at(current_bucket.find(key)).value = value
    else
      node = Node.new
      node.key = key
      node.value = value
      current_bucket.append(node)
    end
    @size += 1
  end
end