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

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    # raise NotImplementedError
    new_node = TreeNode.new(key,value)

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end

  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return @root if @root.nil?
    current = @root

    until current.nil?
      if current.key == key
        return current.value
      elsif key <= current.key
        current = current.left
      else
        current = current.right
      end
    end

    return current
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

  # Add node helper method
  def add_helper(current, new_node)
    return new_node if current.nil?

    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end
    return current
  end

end
