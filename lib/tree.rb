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

  # Time Complexity:
  # Space Complexity:
  def inorder
    raise NotImplementedError
  end

  # Time Complexity:
  # Space Complexity:
  def preorder
    raise NotImplementedError
  end

  # Time Complexity:
  # Space Complexity:
  def postorder
    raise NotImplementedError
  end

  # Time Complexity:
  # Space Complexity:
  def height
    raise NotImplementedError
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    inorder.to_s
  end
end
