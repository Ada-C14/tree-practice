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

  def add_helper(current, key, value = nil)
    
    if current.nil?
      current = TreeNode.new(key, value)
    elsif key <= current.key 
     current.left = add_helper(current.left, key, value)
    else
     current.right = add_helper(current.right, key, value)
    end
 
    return current

  end

  # Time Complexity: O(n) for unbalanced and O(log n ) for balanced
  # Space Complexity: O(n) - stack calls
  def add(key, value = nil)
    @root = add_helper(@root, key, value)
  end

  def find_helper(current, key)
    return nil if current.nil?

    if current.key == key
      return current.value
    elsif key < current.key
      find_helper(current.left, key)
    else # key > root.key
      find_helper(current.right, key)
    end

  end

  # Time Complexity: O(n) for worst case, O(log n) for balanced tree
  # Space Complexity: O(n) - stack call
  def find(key)
    find_helper(@root, key)
  end

  def inorder_helper(node, array) # L,C,R

    if node.nil?
      return array
    else
      inorder_helper(node.left, array)
      array.push({:key => node.key, :value => node.value})
      inorder_helper(node.right, array)
    end

  end

  # Time Complexity: O(n)
  # Space Complexity: O(n) - stack call

  # returns an array of all the elements (keys) in order
  def inorder
    # traverse to the left-most node == smallest key 
    # insert node into new array 

    # clarification questions?
      # are the keys unqiue in the tree?
    
    inorder_helper(@root, [])

  end

  def preorder_helper(current, array) # C,L,R
    if current.nil?
      return array
    else
      array.push({:key => current.key, :value => current.value})
      preorder_helper(current.left, array)
      preorder_helper(current.right, array)
    end

  end

  # Time Complexity: O(n) - hitting every node in the tree
  # Space Complexity: O(n) - stack call
  def preorder
    preorder_helper(@root, [])
  end

  def postorder_helper(current, array) # L,R,C
    if current.nil?
      return array
    else
      
      postorder_helper(current.left, array)
      postorder_helper(current.right, array)
      array.push({:key => current.key, :value => current.value})
    end
  end

  # Time Complexity: O(n) - hitting every node once in the tree
  # Space Complexity: O(n) - stack call
  def postorder
    postorder_helper(@root, [])
  end

 
  def height_helper(current)
    
    if current.nil?
      return 0
    else
      left_depth = height_helper(current.left) + 1
      right_depth = height_helper(current.right) + 1

      return [left_depth, right_depth].max
    end
    
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n) - stack call 
  def height
    return height_helper(@root)
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    return [] if @root.nil?
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
