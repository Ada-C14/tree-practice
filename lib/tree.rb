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
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find(key)
    if @root.nil?
      return nil
    else
      return find_helper(@root, key)
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

  private

  def add_helper(current_node, new_node)
    return new_node if current_node.nil?

    if new_node.key <= current_node.key
      current_node.left = add_helper(current_node.left, new_node)
    else
      current_node.right = add_helper(current_node.right, new_node)
    end

    return current_node 
  end

  def find_helper(current_node, key)
    if current_node.nil?
      return nil
    elsif key < current_node.key
      return find_helper(current_node.left, key)
    elsif key > current_node.key
      return find_helper(current_node.right, key)
    else
      return current_node.value
    end
  end
end

