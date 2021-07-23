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
  # Space Complexity: O(n)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
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

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    find_helper(key, @root)
  end

  def find_helper(key, current)
    return nil if current.nil?

    if current.key == key
      return current.value
    elsif current.key > key
      find_helper(key, current.left)
    elsif current.key < key
      find_helper(key, current.right)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    inorder_helper(@root, [])
  end

  def inorder_helper(current, values)
    return values if current.nil?
    
    inorder_helper(current.left, values)
    values << { key: current.key, value: current.value }
    inorder_helper(current.right, values)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(current, values)
    return values if current.nil?

    values << { key: current.key, value: current.value }
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(current, values)
    return values if current.nil?
    
    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values << { key: current.key, value: current.value }
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return height_helper(@root)
  end

  def height_helper(current)
    return 0 if current.nil?

    if current
      left_height = 1 + height_helper(current.left)
      right_height = 1 + height_helper(current.right)
      return left_height > right_height ? left_height : right_height
    end
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
