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

  # Time Complexity: log(n)
  # Space Complexity: log(n)

  def add_helper(key, value, current)

    if current.key == key
      current.value = value
    elsif current.key > key
      if current.left == nil
        current.left = TreeNode.new(key,value)
      else
        add_helper(key, value, current.left)
      end
    else
      if current.right == nil
        current.right = TreeNode.new(key, value)
      else
        add_helper(key, value, current.right)
      end
    end

  end

  def add(key, value = nil)
    if @root.nil?
      @root = TreeNode.new(key,value) 
      return @root
    else
      add_helper(key, value, @root)
    end

  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find(key)
    if @root.nil?
      return nil
    else
      return find_helper(key, @root)
    end
  end

  def find_helper(key, current)
    return nil if current.nil?
    if current.key == key
      return current.value
    elsif current.key > key
      find_helper(key, current.left)
    else
      find_helper(key, current.right)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)

  def inorder(current = @root, values = [])  
    if current.nil?
      return values
    end

    inorder(current.left, values)
    values.push({key: current.key, value: current.value})
    inorder(current.right, values)
    return values
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)

  def preorder_helper(current, values)
    return values if current.nil?

    values.push({key: current.key, value: current.value})
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)
    
    return values
  end


  def preorder
    current = @root
    values = []
    return preorder_helper(current, values)
  end

 # Time Complexity: O(n)
  # Space Complexity: O(n)

  def postorder_helper(current, values)
    return values if current.nil?

    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values.push({key: current.key, value: current.value})

    return values
  end

  def postorder
    current = @root
    values = []
    return postorder_helper(current, values)
  end

  # Time Complexity: o(n)
  # Space Complexity: O(h), where h = height
  def height(current = @root)
    return 0 if current.nil?
    
    left_child = height(current.left)
    right_child = height(current.right)

    if left_child > right_child
      return left_child + 1
    else
      return right_child + 1
    end

  end

  # Optional Method
  # Time Complexity: O(n) if tree is not balanced; O(log(n)) if it's balanced
  # Space Complexity: o(n)
  def bfs
    values = []
    h = height
    i = 1
    while i <= h
      bfs_helper(@root, i, values)
      i += 1
    end

    return values
  end

  def bfs_helper(current, level, values)
    return values if current.nil?

    if level == 1
      values.push({key: current.key, value: current.value})
    elsif level > 1
      bfs_helper(current.left, level - 1, values)
      bfs_helper(current.right, level - 1, values)
    end
    return values
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
