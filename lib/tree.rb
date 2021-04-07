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
  def add(key, value= nil)
    if @root.nil?
      @root = TreeNode.new(key, value)
    else
      add_helper(@root, key, value)
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def find(key)
    find_helper(@root, key)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    return [] if @root.nil?
    return inorder_helper(@root, [])
    
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return [] if @root.nil?
    return preorder_helper(@root, [])
    
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return [] if @root.nil?
    return postorder_helper(@root, [])
    
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return height_helper(@root)
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  # def bfs
  #   return [] if @root.nil?
  # end

  # Useful for printing
  # 
  def to_s
    return "#{self.inorder}"
  end

  def add_helper(current_node, key, value)

    # if the current_node is nil set the current_node to be a new node
    if current_node.nil?
      current_node = TreeNode.new(key, value)
      # if the value is less than or equal to the current node's value, make the current node's left be the result of calling add on current's left.
    elsif key <= current_node.key 
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?

    if current_node.key == key
      return current_node.value
    elsif key < current_node.key
      find_helper(current_node.left, key)
    else
      find_helper(current_node.right, key)
    end
  end

  # traverse the left subtree
  # visit the current node
  # traverse the right subtree

  def inorder_helper(current_node, arr)
    if current_node
      inorder_helper(current_node.left, arr)
      arr << {key: current_node.key, value: current_node.value}
      inorder_helper(current_node.right, arr)
    end
    return arr
  end

  # visit the current node
  # traverse the left subtree
  # traverse the right subtree

  def preorder_helper(current_node, arr)
    if current_node
      arr << {key: current_node.key, value: current_node.value}
      preorder_helper(current_node.left, arr)
      preorder_helper(current_node.right, arr)
    end
    return arr
  end

# traverse the left subtree
# traverse the right subtree
# visit the current node

  def postorder_helper(current_node, arr)
    if current_node
      postorder_helper(current_node.left, arr)
      postorder_helper(current_node.right, arr)
      arr << {key: current_node.key, value: current_node.value}
    end
    return arr
  end

  # If the current node is nil return 0 else
  # return 1 plus the maximum of the heights of the right and left subtrees

  def height_helper(current_node)
    return 0 if current_node.nil?
    return 1 + [height_helper(current_node.left), height_helper(current_node.right)].max
  end
  
end
