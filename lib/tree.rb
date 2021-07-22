#All Big O is assumed balanced tree

class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # Time Complexity: O(log n)
  # Space Complexity: Olog (n) 
  def add(key, value)
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  def add_helper(current, new_node)
    return new_node if current.nil?

    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end

    return current
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(current, key)
    return nil if current.nil?
    if current.key == key
      return current.value
    elsif key < current.key
      find_helper(current.left, key)
    else 
      find_helper(current.right, key)
    end
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n) 
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(current, nodes)
    return nodes if current.nil?
    inorder_helper(current.left, nodes)
    nodes << {key: current.key, value: current.value}
    inorder_helper(current.right, nodes)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(current, nodes)
    return nodes if current.nil?
    nodes << {key: current.key, value: current.value}
    preorder_helper(current.left, nodes)
    preorder_helper(current.right, nodes)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(current, nodes)
    return nodes if current.nil?
    postorder_helper(current.left, nodes)
    postorder_helper(current.right, nodes)
    nodes << {key: current.key, value: current.value}
  end
  

  # Time Complexity: 
  # Space Complexity: 
  def height
    return height_helper(@root)
  end

  def height_helper(current)
    return 0 if current.nil?
    left = height_helper(current.left)
    right = height_helper(current.right)
    return 1 + [left,right].max
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
