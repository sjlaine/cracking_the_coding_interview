#!/usr/bin/env ruby

require_relative 'singly_linked_list.rb'

# return kth to last element

# brute force
def return_kth_to_last(list, k)
  current = list.head
  vals = []

  while(current.next)
    vals.push(current.val)
    current = current.next
  end

  vals.push(current.val)

  return vals[vals.length - k - 1]
end

# without extra space
def return_kth_to_last2(list, k)
  p1 = list.head
  p2 = p1
  ahead_count = 0

  # move p2 forward until it's k ahead of p1
  while(ahead_count < k && p2.next)
    p2 = p2.next
    ahead_count += 1
  end

  # move both ahead until p2 reaches end
  while(p2.next)
    p1 = p1.next
    p2 = p2.next
  end

  p1.val
end

# knowing the size of the list
def return_kth_to_last3(list, k)
  target = list.size - k - 1
  current = list.head
  idx = 0

  while(current.next && idx < target)
    current = current.next
    idx += 1
  end

  current.val
end

six = Node.new(6)
four = Node.new(4)
five = Node.new(5)
one = Node.new(1)
twenty = Node.new(20)

list = List.new(six)
list.add_to_end(four)
list.add_to_end(five)
list.add_to_end(one)
list.add_to_end(twenty)

list.print

puts "first impl: #{return_kth_to_last(list, 2)}"
puts "second impl: #{return_kth_to_last2(list, 2)}"
puts "third impl: #{return_kth_to_last3(list, 2)}"
