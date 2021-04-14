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

  def add_helper(current_node, new_node)
    return new_node if current.nil?

    if new_node.key <= current_node.key
      current_node.left = add_helper(current_node.left, new_node)
    else 
      current_node.right = add_helper(current_node.right, new_node)
    end 

    return current_node
  end 

  # Time Complexity: o(log(n))
  # Space Complexity: o(1)
  def add(key, value = nil)
    # raise NotImplementedError
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_nodes
    else
      add_helper(@root, new_node)
    end
  end

  def find_helper(current_node,key)
    return nil if current_node.nil? 

    if current_node.key == key
      return current_node.key
    elsif key < current_node.key
      find_helper(current_node, key)
    else 
      find_helper(current_node, key)
    end 
  end 


  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    # raise NotImplementedError
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
end
