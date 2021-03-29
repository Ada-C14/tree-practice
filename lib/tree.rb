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

  # Time Complexity: O(log(n)) assuming that the tree is balanced, binary search will eliminate half of tree every time, otherwise O(n) like linked list
  # Space Complexity: O(n) for stack calls
  def add(key, value)
    return @root = add_helper(@root, key, value)
  end

  def add_helper(current, key, value)
    return @root = TreeNode.new(key, value) if @root.nil?

    if current.nil?
      return current = TreeNode.new(key, value)
    elsif key <= current.key   
      current.left = add_helper(current.left, key, value)
    else
      current.right = add_helper(current.right, key, value)
    end
  end

  # Time Complexity: O(log(n))/O(n)
  # Space Complexity: O(n)
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(current, key)
    return nil if current.nil?
    if key == current.key
      return current.value
    elsif key < current.key
      return find_helper(current.left, key)
    else
      return find_helper(current.right, key)
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
    return "#{self.inorder}"
  end
end
