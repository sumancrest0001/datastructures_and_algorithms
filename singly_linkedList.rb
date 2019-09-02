
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
	  @value = value
    @next_node = next_node
  end
end
class LinkedList
  attr_accessor :head, :tail, :length
  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end
  def add(value)
    newNode = Node.new(value)
    if @head.nil?
      @head = newNode
      @tail = @head
    else
      self.tail.next_node = newNode
      self.tail= newNode
      self.length += 1
    end
  end

  def get(index)
    if index < 0 || index > @length
      return nil
    end
    temp = @head
    index.times { temp = temp.next_node}
    temp
  end

  def pop
    return nil if ! @head
    current = @head
    new_tail = current
    while(current.next_node)
     new_tail = current
     current = current.next_node
    end
    self.tail = new_tail
    self.tail.next_node = nil
    @length -= 1
    #return current.value
  end

  def shift
    return nil if !@head
    current_head = @head
    @head = current_head.next_node
    @length -= 1
    @tail = nil if @length == 0
    #return current_head.value
  end
  def unshift(val)
    newNode = Node.new(val)
    if !@head
      self.head = newNode
      self.tail = @head
    else
      newNode.next_node = @head
      self.head = newNode
    end
    @length +=1

  end
 def set(index, val)
   foundNode = self.get(index)
   if(foundNode)
     foundNode.value = val
   else
     puts "Operation is not possible"
   end
  end

  def size
    count = 0
    current = @head
    while current != nil
      count += 1
      current = current.next_node
    end
    return count
  end

  def remove(index)
    return nil if index < 0 || index >= self.size
    return self.pop() if index == self.size-1
    return self.shift() if index == 0
    while index >=1 && index < self.size-1
      previousNode = self.get(index-1)
      removed = previousNode.next_node
      previousNode.next_node= removed.next_node
      self.length -=1
      return removed.value
    end
  end

  def reverse
    node = self.head
    self.head = self.tail
    self.tail = node
    previous = 0
    nextone = nil
    for i in (0...@length)
      nextone = node.next_node
      node.next_node = previous
      previous = node
      node = nextone
    end
  end

  def display
     current = @head
     full_list = []
     while current != nil
       full_list << current.value
       current = current.next_node
     end
     return full_list
   end
 end

list = LinkedList.new
list.add(3)
list.add(5)
list.add(2)
list.add(1)
list.add(6)
#list.pop()
#list.shift()
#list.unshift(7)
#list.set(1, 9)
#list.remove(1)
list.reverse()
#list.size()
print list.display()
