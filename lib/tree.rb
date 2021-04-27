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
  # Time Complexity: O(logn)
  # Space Complexity: O(logn)
  def add(key, value = nil)
    @root = add_helper(@root, key, value)
  end

  def find_helper(current, key)
    return nil if current.nil?

    if current.key == key
      return current.value
    elsif key < current.key
      return find_helper(current.left, key)
    else
      return find_helper(current.right, key)
    end
  end

  # Time Complexity: O(logn)
  # Space Complexity: O(logn)

  def find(key, current = @root)
    return find_helper(current, key)
  end

  def inorder_helper(current, values)
    return values if current.nil?

    inorder_helper(current.left, values)
    values.push({:key=>current.key, :value=>current.value})
    inorder_helper(current.right, values)
    return values
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    values = []
    return inorder_helper(@root, values)
  end

  def preorder_helper(current, values)
    return values if current.nil?

    values.push({:key=>current.key, :value=>current.value})
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)
    return values
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    values = []
    return preorder_helper(@root, values)
  end

  def postorder_helper(current, values)
    return values if current.nil?

    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values.push({:key=>current.key, :value=>current.value})
    return values
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    values = []
    return postorder_helper(@root, values)
  end

  def height_helper(current)
    return 0 if current.nil?

    return 1 + [height_helper(current.left), height_helper(current.right)].max
  end
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    height_helper(@root)
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
