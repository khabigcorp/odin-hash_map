require './lib/LinkedList.rb'
require './lib/Node.rb'
class HashMap
  def initialize(load)
    @load = load
    @capacity = 20
    @storage = Array.new(20) {|item| item = LinkedList.new}
    @key_count = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  def set(key, value)
    current_bucket = @storage[hash(key) % @capacity]
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
    current_bucket = @storage[hash(key) %  @capacity]
    puts current_bucket.head
    if current_bucket.contains?(key)
      return current_bucket.at(current_bucket.find(key)).value
    else
      puts "Couldn't find key"
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

  def clear
    @storage.clear
  end

  def keys
    keys = []
    @storage.each do |bucket|
      if (bucket.size != 0)
        bucket.each do |key, value|
          keys << key
        end
      end
    end
    keys
  end

  def values
    values = []
    @storage.each do |bucket|
      if (bucket.size != 0)
        bucket.each do |key, value|
          values << value
        end
      end
    end
    values
  end

  def entries
    entries = []
    @storage.each do |bucket|
      if (bucket.size != 0)
        bucket.each do |key, value|
          entries << [key, value]
        end
      end
    end
    entries
  end
end