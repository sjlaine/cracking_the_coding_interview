# singly-linked list
class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

class List
  attr_accessor :head, :size

  def initialize(head)
    @head = head
    @size = 1
  end

  def add_to_beginning(node)
    node.next = head
    @head = node
    @size += 1
  end

  def add_to_end(node)
    current = head

    while(current.next)
      current = current.next
    end

    current.next = node
    @size += 1
  end

  def remove(node)
    # traverse the list until current == node
    if(head == node)
      @head = head.next
      return true
    end

    current = head

    while(!current.next.nil?)
      if(current.next == node)
        # remove node
        current.next = node.next
        return true
      else
        current = current.next
      end
    end

    return false
  end

  def print
    current = head

    while(!current.next.nil?)
      puts current.val
      current = current.next
    end

    puts current.val
  end
end
