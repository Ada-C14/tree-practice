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

  # Time Complexity: O(log(n)) - Assuming the tree is somewhat balanced, this could potentially be O(log(n)) because we may have to traverse the height of the tree to get to a leaf node. 
  # Space Complexity: O(n) - for recursive solution, there is space in the form of the call stack
  # Space Complexity: O(1) - for while loop
  
  def add(key, value = nil)
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end

  end

  def add_helper(current, new_node)
    return new_node if current.nil?

    if current.key > new_node.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end
    return current

    
    # try it with a while loop
    # until current.nil?
    #   if current.value > new_node.value && current.left.nil?
    #     current.left = new_node
    #     return
    #   elsif current.value > new_node.value
    #     current = current.left
    #   elsif current.value <= new_node.value && current.right.nil?
    #     current.right = new_node
    #     return
    #   elsif current.value <= new_node.value
    #     current = current.right
        
    #   end
    # end
    # return current
  end

  # Time Complexity: O(log(n))for balanced tree, O(n) if not.
  # Space Complexity: O(n) for call stack. 
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

  # Time Complexity: O(n) - because we have to access each node?
  # Space Complexity: O(n) because of the array? or O(log(n)) - a little trouble understanding this
  def inorder
    current = @root
    values = []
    return inorder_helper(current, values)

  end

  def inorder_helper(current, values)
    return values if current.nil?

    inorder_helper(current.left, values)
    values.push({key: current.key, value: current.value})
    inorder_helper(current.right, values)
    
    return values
  end

  # Time Complexity:O(n) because we have to access each node?
  # Space Complexity: O(n) because of the array. 
  def preorder
    current = @root
    values = []
    return preorder_helper(current, values)
  end

  def preorder_helper(current, values)
    return values if current.nil?

    values.push({key: current.key, value: current.value})
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)
    
    return values
  end

  # Time Complexity: O(n) because we have to access each node?
  # Space Complexity: O(n) because of the array.
  def postorder
    current = @root
    values = []
    return postorder_helper(current, values)
  end

  def postorder_helper(current, values)
    return values if current.nil?

    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values.push({key: current.key, value: current.value})

    return values
  end

  # Time Complexity: O(log(n)) if tree is balanced, O(n) if not.
  # Space Complexity: O(log(n)) due to the stack.
  def height
    return height_helper(@root)
  end

  def height_helper(current)
    return 0 if current.nil?
    
    # how to use dynamic programming here?
    left_height = height_helper(current.left)
    right_height = height_helper(current.right)

    return [left_height + 1, right_height + 1].max

  end
  

  # Optional Method
  # Time Complexity: O(n^2) worse-case if tree is not balanced, O(log(n) * n) if tree is balanced?
  # Space Complexity: O(n) due to the array. The stack call is at worse O(n) if tree isn't balanced, O(log(n)) if it is. 
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
