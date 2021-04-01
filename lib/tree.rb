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
  # Space Complexity: O(log n)
  def add(key, value = nil)
    if @root.nil?
      @root = TreeNode.new(key, value)
      return
    end

    add_helper(@root, key, value)
  end

  def add_helper(node, key, value)
    if key <= node.key
      if node.left.nil?
        node.left = TreeNode.new(key, value)
        return
      else
        add_helper(node.left, key, value)
      end
    else
      if node.right.nil?
        node.right = TreeNode.new(key, value)
        return
      else
        add_helper(node.right, key, value)
      end
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    find_helper(@root, key)
  end

  def find_helper(node, key)
    if node.nil?
      return nil
    elsif key == node.key
      return node.value
    elsif key < node.key
      find_helper(node.left, key)
    elsif key > node.key
      find_helper(node.right, key)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(node, traversal)
    return traversal if node.nil?

    inorder_helper(node.left, traversal)
    traversal << {key: node.key, value: node.value}
    inorder_helper(node.right, traversal)
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(node, traversal)
    return traversal if node.nil?

    traversal << {key: node.key, value: node.value}
    preorder_helper(node.left, traversal)
    preorder_helper(node.right, traversal)
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(node, traversal)
    return traversal if node.nil?

    postorder_helper(node.left, traversal)
    postorder_helper(node.right, traversal)
    traversal << {key: node.key, value: node.value}
  end

  # Time Complexity: 
  # Space Complexity: O(log n)
  def height
    return height_helper(@root)
  end

  def height_helper(node)
    return 0 if node.nil?

    return 1 + [height_helper(node.left), height_helper(node.right)].max
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    traversal = []
    h = self.height
    i = 1
    while i <= h
      bfs_helper(@root, traversal, i)
      i += 1
    end

    return traversal
  end

  def bfs_helper(node, traversal, level)
    return traversal if node.nil?
    
    if level == 1
      traversal << {key: node.key, value: node.value}
      return traversal
    elsif level > 1
      bfs_helper(node.left, traversal, level - 1)
      bfs_helper(node.right, traversal, level - 1)
    end
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
