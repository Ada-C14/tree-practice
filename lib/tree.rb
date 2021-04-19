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

  # Time Complexity: O(log n) for a balanced tree, O(n) for an unbalanced tree
  # Space Complexity: same as time complexity
  def add(key, value = nil, current = @root)
    return @root = TreeNode.new(key, value) if current.nil?
    if key <= current.key
      current.left ? add(key, value, current.left) : current.left = TreeNode.new(key, value)
    else
      current.right ? add(key, value, current.right) : current.right = TreeNode.new(key, value)
    end
  end

  # Time Complexity: O(log n) for a balanced tree, O(n) for an unbalanced tree
  # Space Complexity: same as time complexity
  def find(key, current = @root)
    return nil if current.nil?
    return current.value if current.key == key
    if key < current.key
      find(key, current.left)
    else key > current.key
      find(key, current.right)
    end
  end

  # Time Complexity: 0(n) with n being number of nodes in the tree
  # Space Complexity: O(n)
  def inorder(current = @root, elements = [])
    return elements if current.nil?
    inorder(current.left, elements)
    elements << {:key => current.key, :value => current.value}
    inorder(current.right, elements)
  end

  # Time Complexity: 0(n) with n being number of nodes in the tree
  # Space Complexity: O(n)
  def preorder(current = @root, elements = [])
    return elements if current.nil?
    elements << {:key => current.key, :value => current.value}
    preorder(current.left, elements)
    preorder(current.right, elements)
  end

  # Time Complexity: 0(n) with n being number of nodes in the tree
  # Space Complexity: O(n)
  def postorder(current = @root, elements = [])
    return elements if current.nil?
    postorder(current.left, elements)
    postorder(current.right, elements)
    elements << {:key => current.key, :value => current.value}
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height(current = @root)
    return 0 if current.nil?
    return 1 + [height(current.left), height(current.right)].max 
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
