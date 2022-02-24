# Route between two nodes: given a directed graph, design an algorithm to find out whether there is a route between two nodes

#!/usr/bin/env ruby

require_relative "graph.rb"
require_relative "queue.rb"

zero = Node.new(0)
one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)
five = Node.new(5)
six = Node.new(6)

zero.add_child(one)
one.add_child(two)
two.add_child(zero)
two.add_child(three)
three.add_child(two)

six.add_child(five)
five.add_child(four)
four.add_child(six)

nodes = [zero, one, two, three, four, five, six]

graph = Graph.new(nodes)
graph.print

# breadth first search
def route_between?(node1, node2)
  queue = Queue.new()

  node1.children.each do |child|
    child.visited = true
    return true if child == node2

    queue.add(child)
  end

  while(!queue.is_empty?)
    current = queue.remove
    unless(current.visited)
      current.visited = true

      return true if current == node2
    end

    current.children.each do |child|
      queue.add(child) unless child.visited
    end
  end

  false
end

puts route_between?(one, three) # true
puts route_between?(one, six) # false
