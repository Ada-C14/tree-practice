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

  # Time Complexity: O(log n) if balanced, otherwise O(n) where n is number of nodes
  # Space Complexity: O(n), n is height
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

    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end

    return current
  end  

  # Time Complexity: O(log n) again if balanced
  # Space Complexity: O(n) again
  def find(key)
    if @root.nil?
      return @root
    else
      return find_helper(@root, key)
    end
  end

  def find_helper(current, key)
    if current.nil?
      return nil
    elsif key < current.key
      return find_helper(current.left, key)
    elsif key > current.key
      return find_helper(current.right, key)    
    else        
      return current.value
    end  
  end  

  # Time Complexity: O(n), n is number of nodes
  # Space Complexity: O(n)
  def inorder
    tree_node_arr = []
    current = @root

    return tree_node_arr if @root.nil?

    inorder_helper(current, tree_node_arr)
  end

  def inorder_helper(current, arr)
    # traverse the left subtree
    # visit the current node
    # traverse the right subtree

    if current
      inorder_helper(current.left, arr)
      arr.push({key: current.key, value: current.value})
      inorder_helper(current.right, arr)
    end 
    return arr
  end  

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder

    tree_node_arr = []
    current = @root

    return tree_node_arr if current.nil?

    preorder_helper(current, tree_node_arr)
  end

  def preorder_helper(current, arr)
    # visit the current node
    # traverse the left subtree
    # traverse the right subtree

    if current
      arr.push({key: current.key, value: current.value})
      preorder_helper(current.left, arr)
      preorder_helper(current.right, arr)
    end 
    return arr  
  end  

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    tree_node_arr = []
    current = @root

    return tree_node_arr if @root.nil?
    postorder_helper(current, tree_node_arr)
  end

  def postorder_helper(current, arr)
    # traverse the left subtree
    # traverse the right subtree
    # visit the current node

    if current
      postorder_helper(current.left, arr)
      postorder_helper(current.right, arr)
      arr.push({key: current.key, value: current.value})
    end 
    return arr  
  end  

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return 0 if @root.nil?
    current = @root

    height_helper(current)
  end

  def height_helper(current)
    return 0 if current.nil?

    return [(height_helper(current.left) + 1), (height_helper(current.right) + 1)].max
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

