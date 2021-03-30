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

  def add_helper(current, new_node)
  return new_node if current.nil?

  if new_node.key <= current.key 
    current.left = add_helper(current.left, new_node)
  else
    current.right = add_helper(current.right, new_node)
  end

  return current
  end

  # Time Complexity: O(logn(n))
  # Space Complexity: O(n)
  def add(key, value = nil)
    # raise NotImplementedError
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  def find_helper(current, key)
    return nil if current.nil?

    if current.key == key
      return current.value
    elsif key < current.key
      find_helper(current.left, key )
      
    else 
      find_helper(current.right, key )
    end

  end

  # Time Complexity: O(log(n))
  # Space Complexity: O(n)
  def find(key)
    # raise NotImplementedError
    if @root.nil?
      return nil
    else
      return find_helper(@root, key)
    end
  end

  def inorder_helper(current, values)
    if current.nil?
      return values
    end

    inorder_helper(current.left, values)
    values.push({key: current.key, value: current.value})
    inorder_helper(current.right, values)
    return values
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    # raise NotImplementedError
    values = []
    return inorder_helper(@root, values)
  end

  def preorder_helper(current, values)
    if current.nil?
      return values
    end

    values.push({key: current.key, value: current.value})
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)
    return values
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    # raise NotImplementedError
    values = []
    return preorder_helper(@root, values)
  end

  def postorder_helper(current, values)
    if current.nil?
      return values
    end

    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values.push({key: current.key, value: current.value})
    return values
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    # raise NotImplementedError
    values = []
    return postorder_helper(@root, values)
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    # raise NotImplementedError
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    # raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
