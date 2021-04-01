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

  # Time Complexity: O(log(n))
  # Space Complexity: O(1)
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
  # Space Complexity: O(1)
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

  # Time Complexity: O(n)
  # Space Complexity: O(n)
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

  # Time Complexity: O(n)
  # Space Complexity: O(n)
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

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    # raise NotImplementedError
    values = []
    return postorder_helper(@root, values)
  end

  def height_helper(current)
    return 0 if current.nil?

    left_height = height_helper(current.left) + 1
    right_height = height_helper(current.right) + 1

    return [left_height, right_height].max
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    # raise NotImplementedError
    height_helper(@root)
  end

  

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    # raise NotImplementedError
    # return [] if @root.nil?

    
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
