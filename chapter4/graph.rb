class Graph
  attr_reader :nodes

  def initialize(nodes)
    @nodes = nodes
  end

  def insert(child, parent)
    parent.add_child(child)
  end

  def remove
    # TODO
  end

  def print
    nodes.each do |node|
      puts "#{node.name}: #{node.child_string}"
    end
  end
end

class Node
  attr_accessor :name, :children, :visited

  def initialize(name)
    @name = name
    @children = []
    @visited = false
  end

  def add_child(node)
    children.push(node)
  end

  def child_string
    children.map(&:name).join(", ")
  end

  def has_children?
    children.any?
  end
end
