require './lib/LinkedList.rb'
require './lib/Node.rb'
class HashMap
  def initialize(load_factor)
    @load_factor = load_factor
    @capacity = 16
    @storage = Array.new(16) {|item| item = LinkedList.new}
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

    if (@key_count.to_f / @capacity > 0.75)
      resize
    end
  end

  def get(key)
    current_bucket = @storage[hash(key) %  @capacity]
    if current_bucket.contains?(key)
      return current_bucket.at(current_bucket.find(key)).value
    else
      puts "Couldn't find key"
      return nil
    end
  end

  def has?(key)
    current_bucket = @storage[hash(key) % @capacity]
    return current_bucket.contains?(key)
  end

  def remove(key)
    current_bucket = @storage[hash(key) % @capacity]
    if current_bucket.contains?(key)
      key_location = current_bucket.find(key)
      key_value = current_bucket.at(key_location).value
      current_bucket.remove_at(key_location)
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
    each_entry do |key, value|
      keys << key
    end
    keys
  end

  def values
    values = []
    each_entry do |key, value|
      values << value
    end
    values
  end

  def entries
    entries = []
    each_entry do |key, value|
      entries << [key, value]
    end
    entries
  end

  private

  def each_entry(container = @storage)
    container.each do |bucket|
      if (bucket.size != 0)
        bucket.each do |key, value|
          yield(key, value)
        end
      end
    end
  end

  def resize()
    old_container = @storage
    @capacity = @capacity*1.25
    @storage = Array.new(@capacity) { |item| item = LinkedList.new }
    each_entry(old_container) do |key, value|
      set(key, value)
    end
  end
end