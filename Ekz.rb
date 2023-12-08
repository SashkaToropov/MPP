class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      current_node = @head
      while current_node.next_node
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
    end
  end

  def prepend(data)
    new_node = Node.new(data, @head)
    @head = new_node
  end

  def display
    current_node = @head
    while current_node
      puts current_node.data
      current_node = current_node.next_node
    end
  end

  def size
    count = 0
    current_node = @head
    while current_node
      count += 1
      current_node = current_node.next_node
    end
    count
  end
end

# Example Usage
linked_list = LinkedList.new
linked_list.append(1)
linked_list.append(2)
linked_list.append(3)

puts "Linked List:"
linked_list.display

puts "Size of the Linked List: #{linked_list.size}"

linked_list.prepend(0)
puts "Linked List after prepending 0:"
linked_list.display
