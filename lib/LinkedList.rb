require './lib/Node.rb'

class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  
  def append(node)
    if !@tail.nil?
      @tail.next_node = node
    else
      @head = node
    end
    
    @tail = node
    
    @size += 1
  end

  def prepend(node)
    add_node = Node.new
    add_node.value = node

    if @head.nil?
      @tail = add_node
    end
    
    add_node.next_node = @head
    @head = add_node

    @size += 1
  end

  def size
    @size
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    if index >= @size || index < 0
      return nil
    end

    node = @head
    index.times { node = node.next_node }
    node
  end

  def pop
    if @size == 0
      return nil
    end
    
    self.at(@size-2).next_node = nil
    @tail = nil
    @size -= 1
  end

  def contains?(value)
    node = @head
    while !node.nil?
      if (node.value == value)
        return true
      end
      node = node.next_node
    end

    return false
  end

  def find(value)
    node = @head
    index = 0
    while !node.nil?
      if (node.value == value)
        return index
      end
      index += 1
      node = node.next_node
    end

    return nil
  end

  def insert_at(value, index)
    previous_node = at(index-1)
    if !previous_node.nil?
      node = Node.new
      node.value = value
      following_node = previous_node.next_node
      previous_node.next_node = node
      node.next_node = following_node
      @size += 1
    else
      prepend(value)
    end
    value
  end

  def remove_at(index)
    if @size == 0
      return nil
    end

    if index == @size - 1
      pop
    elsif index == 0
      @head = @head.next_node
    else
      previous_node = at(index-1)
      new_next_node = previous_node.next_node.next_node
      previous_node.next_node = new_next_node
    end
    @size -= 1
  end

  def to_s
    super_string = ""
    node = @head
    while !node.nil?
      super_string += "( #{node.value} ) -> "
      node = node.next_node
    end

    super_string += "nil"
    super_string
  end
end