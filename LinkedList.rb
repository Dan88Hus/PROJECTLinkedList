class LinkedList
  class Node
    attr_accessor :next_node, :value

    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end      
  end

  def initialize(node = Node.new)
    @node = node
  end

  def head
    @node
  end

  def tail(node = self.head)
    return node if node.next_node.nil?
    tail(node.next_node)					#recursive line
  end

  def append(value)
    unless self.head.value.nil?      
       return self.tail.next_node = Node.new(value) if self.tail.next_node.nil?
    else
      @node = Node.new(value)
    end
  end

  def prepend(value)
    if self.head.value.nil?
      @node = Node.new(value)
    else
      @node = Node.new(value, head)
    end
  end

  def pop(node = head)
    if node.next_node == self.tail
      puts tail.value
      return node.next_node = nil
    end
    pop(node.next_node)
  end

  def size(count = 0, node = head)
    return count if node.nil?
    count += 1
    size(count, node.next_node)			#recursive line
  end

  def at(index, node = head, count = 0)
    return node if count == index
    count += 1 
    at(index, node.next_node, count)
  end

  def contains?(value, node = head)
    if node.value == value
      return true
    elsif node.next_node.nil?
      return false
    end
    contains?(value, node.next_node)
  end

  def find(value, node = head, count = 0)
    return nil unless self.contains?(value)
    return count if node.value == value
    count +=1
    find(value, node.next_node, count)
  end

  def to_s(node = head, output = "")
    output += " ( #{node.value} ) ->"
    return output + " nil" if node.next_node.nil?
    to_s(node.next_node, output )
  end




  def insert_at(value, index)
    shifting_node = self.at(index)
    unless shifting_node == self.head
      previous_node = self.at(index-1)
      previous_node.next_node = Node.new(value, shifting_node)
    else
      prepend(value)
    end
  end

 def remove_at(index)
    leaving_node = self.at(index)
    unless leaving_node == self.head
      self.at(index-1).next_node = leaving_node.next_node if index < self.size
    else
      @node = leaving_node.next_node
    end
  end
end


list = LinkedList.new
list.append('D')
list.append('A')
list.append('N')
list.append('I')
list.append('E')
list.append('L')
puts list
list.prepend('Mr.')
puts list.size
puts list.at(3).value
list.pop
puts list.contains?('Z')
puts list.find('I')
puts list.to_s
list.insert_at('O',6)
list.insert_at('Z',7)

puts list
list.remove_at(4)
puts list

