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

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def add(key, value)
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  # Time Complexity: O(log n) 
  # Space Complexity: O(log n)
def find_helper(current, key)
  return nil if current.nil?

  if current.key == key
    return current.value
  elsif key <= current.key
    return find_helper(current.left, key)
  else
    return find_helper(current.right, key)
  end
end

  def find(key)
    return find_helper(@root, key)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder_helper(current, keys_values)
    return keys_values if current.nil?

    inorder_helper(current.left, keys_values)
    keys_values.push({:key => current.key, :value => current.value})
    inorder_helper(current.right, keys_values)
    return keys_values
  end

  def inorder
    keys_values = []
    current = @root
    return inorder_helper(@root, keys_values)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder_helper(current, keys_values)
    return keys_values if current.nil?

    keys_values.push({:key => current.key, :value => current.value})
    preorder_helper(current.left, keys_values)
    preorder_helper(current.right, keys_values)
    return keys_values
  end

  def preorder
    keys_values = []
    current = @root
    return preorder_helper(@root, keys_values)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder_helper(current, keys_values)
    return keys_values if current.nil?

    postorder_helper(current.left, keys_values)
    postorder_helper(current.right, keys_values)
    keys_values.push({:key => current.key, :value => current.value})

    return keys_values
  end

  def postorder
    keys_values = []
    current = @root
    return postorder_helper(@root, keys_values)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height_helper(current, height)
    return height if current.nil?

    max_left = height_helper(current.left, height + 1)
    max_right = height_helper(current.right, height + 1)
    height_tree = [max_left, max_right].max

    return height_tree
  end

  def height
    return height_helper(@root, 0)
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
