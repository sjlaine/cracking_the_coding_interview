#!/usr/bin/env ruby

require_relative 'list_node.rb'

def remove_dupes(list)
  p1 = list.head
  p2 = p1.next

  while(p2 && !p1.next.nil?)
    while(!p2.next.nil?)
      next_node = p2.next

      if(p1.val == p2.val)
        list.remove(p2)
      end

      p2 = next_node
    end

    p1 = p1.next
    p2 = p1&.next
  end
end

one = Node.new(1)
four = Node.new(4)
four2 = Node.new(4)
one2 = Node.new(1)
twenty = Node.new(20)

list = List.new(one)
one.next = four
four.next = four2
four2.next = one2
one2.next = twenty

list.print

remove_dupes(list)

list.print
