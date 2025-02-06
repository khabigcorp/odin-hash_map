require './lib/LinkedList.rb'
require './lib/Node.rb'
class HashMap
  def intialize(load, capacity)
    @load = load
    @capacity = capacity
    @storage = Array.new(capacity)
    @key_count = 0
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
    @key_count += 1
  end

  def get(key)
    current_bucket = @storage[hash(key) % capacity]
    if current_bucket.contains?(key)
      return current_bucket.at(current_bucket.find(key)).value
    else
      return nil
    end
  end

  def has?(key)
    current_bucket = @storage[hash(key) % capacity]
    return current_bucket.contains?(key)
  end

  def remove(key)
    current_bucket = @storage[hash(key) % capacity]
    if current_bucket.contains?(key)
      key_location = current_bucket.find(key)
      key_value = current_bucket.at(key_location).value
      current_bucket.remove(key_location)
      return key_value
    else
      return nil
    end
    @key_count -= 1
  end

  def length
    return @key_count
  end
end