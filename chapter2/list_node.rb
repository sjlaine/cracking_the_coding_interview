# singly-linked list
class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

class List
  attr_accessor :head

  def initialize(head)
    @head = head
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
