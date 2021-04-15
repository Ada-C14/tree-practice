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
  # Space Complexity: [O(1)-if it's a loop] - why do I wanna say O(n)?? help me. 
  # Try with a while loop
  def add(key, value = nil)
    if @root.nil?
      @root = TreeNode.new(key, value)
    else
      add_helper(@root, key, value)
    end
  end

  def add_helper(current, key, value)
    # if current = return TreeNode.new
    if key < current.key
      # if current.left is nil place the new node
      # otherwise make current.left the new current and run through the same checks
      if current.left.nil? 
        current.left = TreeNode.new(key, value)
        return
      else
        add_helper(current.left, key, value)
      end
    else 
      if current.right.nil? 
        current.right = TreeNode.new(key, value)
        return
      else
        add_helper(current.right, key, value)
      end
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(current, key)
    if current.nil?
      return nil
    end
    if current.key == key
      return current.value
    end
    if key > current.key 
      return find_helper(current.right, key)
    else
      return find_helper(current.left, key)
    end 
  end

  # Time Complexity: 
  # Space Complexity: 
    # left-root-right
  def inorder
    # current = @root
    inorder_helper(@root, [])
  end

  def inorder_helper(current, values) # Values is an array
    if current.nil?
      return values
    end
    inorder_helper(current.left, values)
    values.push({:key=>current.key, :value=>current.value})
    inorder_helper(current.right, values)
    return values
  end


  # Time Complexity: 
  # Space Complexity: 
    # root-left-right
  def preorder
    preorder_helper(@root, [])
  end

  def preorder_helper(current, values)
    if current.nil?
      return values
    end
    values.push({:key=>current.key, :value=>current.value})
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)
    return values
  end

  # Time Complexity: 
  # Space Complexity: 
    # left-right-root
  def postorder
    postorder_helper(@root, [])
  end

  def postorder_helper(current, values)
    if current.nil?
      return values
    end
    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values.push({:key=>current.key, :value=>current.value})
    return values
  end

  # Time Complexity: O(n)^2
  # Space Complexity: 
  def height
    # raise NotImplementedError
    height_helper(@root)
  end
  def height_helper(current)
    if current.nil? 
      return 0 
    end
    left_height = height_helper(current.left)
    right_height = height_helper(current.right)
    if left_height > right_height
      return left_height + 1
    else
      return right_height + 1
    end
    # return [left_height, right_height].max
    # left_height = height_helper(current.left) + 1
    # right_height = height_helper(current.right) + 1
    # return [left_height, right_height].max
    # return 1 + [height_helper(current.left),height_helper(current.right)].max 
  end


# **********************************************************************
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
