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
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    find_helper(@root,key)
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

# Helper methods
def add_helper(current, key, value = nil)
  if current.nil?
    current = TreeNode.new(key, value)
  elsif key >= current.key
    current.right = add_helper(current.right, key, value)
  else
    current.left = add_helper(current.left, key, value)
  end
  
  return current

end

def find_helper(current, key)
  return nil if current.nil?

  if key == current.key
    return current.value
  elsif key > current.key
    return find_helper(current.right, key)
  elsif key < current.key
    return find_helper(current.left, key)
  end
end