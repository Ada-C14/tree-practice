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
  def add_helper(key, value, current)
    if key <= current.key
      current.left ? add_helper(key, value, current = current.left) : current.left = TreeNode.new(key, value)
    else
      current.right ? add_helper(key, value, current = current.right) : current.right = TreeNode.new(key, value)
    end
  end

  def add(key, value)
    if @root.nil?
      @root = TreeNode.new(key, value)
      return @root
    end
    add_helper(key, value, current = @root)
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find_helper(key, current)
    return nil if current.nil?
    return current.value if current.key == key
    if key < current.key
      find_helper(key, current = current.left)
    else key > current.key
      find_helper(key, current.right)
    end
  end

  def find(key)
    find_helper(key, current = @root)
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return [] if @root.nil?

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
