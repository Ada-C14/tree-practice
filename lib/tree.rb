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
  # Space Complexity: O(1)
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  def add_helper(root, key, value)
    if root.nil?
      root = TreeNode.new(key, value)
      return root
    end

    if root.key > key
      root.left = add_helper(root.left, key, value)
    else
      root.right = add_helper(root.right, key, value)
    end

    root
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    find_helper(@root, key)
  end

  def find_helper(node, key)
    return nil if node.nil?

    if node.key == key
      node.value
    elsif node.key < key
      find_helper(node.right, key)
    else
      find_helper(node.left, key)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    result = []
    inorder_helper(@root, result)
    result
  end

  def inorder_helper(node, result)
    return if node.nil?

    inorder_helper(node.left, result)
    result.push({ key: node.key, value: node.value })
    inorder_helper(node.right, result)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    result = []
    preorder_helper(@root, result)
    result
  end

  def preorder_helper(node, result)
    return if node.nil?

    result.push({ key: node.key, value: node.value })
    preorder_helper(node.left, result)
    preorder_helper(node.right, result)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    result = []
    postorder_helper(@root, result)
    result
  end

  def postorder_helper(node, result)
    return if node.nil?

    postorder_helper(node.left, result)
    postorder_helper(node.right, result)
    result.push({ key: node.key, value: node.value })
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    height_helper(@root, 0)
  end

  def height_helper(node, steps)
    return steps if node.nil?

    [height_helper(node.left, steps + 1), height_helper(node.right, steps + 1)].max
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
    return [] if @root.nil?
  end

  # Useful for printing
  def to_s
    inorder.to_s
  end
end
