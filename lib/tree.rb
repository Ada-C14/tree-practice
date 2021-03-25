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
  # >> Assuming balanced BST, O(log n) time complexity (half the num nodes to check each time)
  # >> If not balanced, could by O(n)
  # Space Complexity: O(1)
  # >> keep track of current tree node
  def add(key, value)
    @root = TreeNode.new(key, value) if @root.nil?
    
    current = @root
    while current.right && current.left
      current = if key > current.key
                  current.right
                else
                  current.left
                end
    end
    
    if key > current.key
      current.right = TreeNode.new(key, value)
    else
      current.left = TreeNode.new(key, value)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    raise NotImplementedError
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
    return "#{self.inorder}"
  end
end
