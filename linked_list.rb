
class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end




class LinkedList
  attr_reader :size, :head, :tail

  def initialize
    @head = Node.new
    @size = 0
    @tail = @head
  end

  def append(value)
    # if the head's value is nil, put the value in the head
    if @head.value == nil
      @size += 1
      return  @head.value = value
    end

    # if the head has a value, traverse to the end and add a new node with value
    unless @head.value == nil
      new_node = Node.new
      new_node.value = value

      temp_node = @head
      temp_node = temp_node.next_node until temp_node.next_node == nil
      temp_node.next_node = new_node
      @tail = new_node
      @size += 1
      return new_node.value
    end

  end

  def prepend(value)
    # if the head's value is nil, put the value in the head
    if @head.value == nil
      @size += 1
      return @head.value = value
    end
    #if there's a head value, put it in temp, make a new head and stick it there
    unless @head.value == nil
      temp_node = @head
      new_node = Node.new
      new_node.value = value
      new_node.next_node = temp_node
      @head = new_node
      @size += 1
      return new_node.value
    end

  end


  def at(index)
    temp_node = @head
    i = 0
    until temp_node == nil
      if index == i
        return temp_node
      else
        temp_node = temp_node.next_node
        i += 1
      end
    end
    return "no node at that index"
  end


  def pop
    current_node = @head
    previous_node = nil
    until current_node.next_node == nil
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil
    @size -= 1
    return current_node
  end


  def contains?(value)
    temp_node = @head
    until temp_node == nil
      if temp_node.value == value
        return true
      else
        temp_node = temp_node.next_node
      end
    end
    return false
  end


  def find(value)
    index = 0
    temp_node = @head
    until temp_node == nil
      if temp_node.value == value
        return index
      else
        temp_node = temp_node.next_node
        index += 1
      end
    end
    return nil
  end


  def to_s
    temp_node = @head
    graph = " ( #{temp_node.value} ) "

    until temp_node.next_node == nil
      temp_node = temp_node.next_node
      graph += "-> ( #{temp_node.value} ) "
    end
    graph += "-> nil"
    return graph
  end


  def insert_at(value, index)
    # consider if the list is empty
    # consider if the list has only the head
    # consider if the index is bigger than than the list size
    # deny insertion if for the above cases
    return "error: insertion denied." if self.size < 2 || index > self.size

    # get the node right before index
    # create a new node with the new value
    # set new_node.next_node = previous_node.next_node
    # set previous_node.next_node = new_node
    # return the value of new_node
    previous_node = self.at(index - 1)
    new_node = Node.new
    new_node.value = value
    new_node.next_node = previous_node.next_node
    @size += 1
    previous_node.next_node = new_node
    return new_node.value
  end


  def remove_at(index)
    # remove the node at a given index
    # check if a node at the index exists
    return "the index does not exist" if index >= @size || index < 0

    # if it's the head, make the next node the head
    if index == 0
      @size -= 1
      return @head = @head.next_node
    end

    # otherwise, get the previous_node and the current_node
    # set previous_node.next_node = current_node.next_node
    previous_node = self.at(index - 1)
    current_node = self.at(index)
    previous_node.next_node = current_node.next_node
    @size -= 1
    return current_node
  end

end


p l = LinkedList.new
p l.append("og head value")
p l.size
p l.append("tail value")
p l.size
p l.prepend("new head")
p l.head.next_node.next_node.value
p l.size
p l.head
p l.tail
p l.find("og head value")
puts l
p l.insert_at("inserted value", 3)
puts l
p l.remove_at(3)
puts l
