class Tree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  # keep count of left and right then pick max
  def count_levels(root)
    if (root.nil?)
      return 0
    else
      return [count_levels(root.left), count_levels(root.right)].max + 1
    end
  end

  def tabs(count)
    str = ''
    while(count > 0)
      str += '  '
      count -= 1
    end

    str
  end

  def print_tree
    current = root
    puts "    #{root}"
    while(current.left && current.right)

    end
  end
end

class Node
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end

  def insert_right(node)
    raise 'spot filled' unless right.nil?
    right = node
  end

  def insert_left(node)
    raise 'spot filled' unless left.nil?
    left = node
  end
end
