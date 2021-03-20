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

  def add_helper(current, key, value)
    
    if current.nil?
      current = TreeNode.new(key, value)
    elsif key <= current.key 
     current.left = add_helper(current.left, key, value)
    else
     current.right = add_helper(current.right, key, value)
    end
 
    return current

  end

  # Time Complexity: O(n) for unbalanced and O(log n ) for balanced
  # Space Complexity: O(n) - stack calls
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  def find_helper(current, key)
    return nil if current.nil?

    if current.key == key
      return current.value
    elsif key < current.key
      find_helper(current.left, key)
    else # key > root.key
      find_helper(current.right, key)
    end

  end

  # Time Complexity: O(n) for worst case, O(log n) for balanced tree
  # Space Complexity: O(n) - stack call
  def find(key)
    find_helper(@root, key)
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
