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

  # Time Complexity: O(1)
  # Space Complexity: O(n)
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

    if new_node.key < current.key
      current.left = add_helper(current.left, new_node)
    elsif new_node.key > current.key
      current.right = add_helper(current.right, new_node)
    end 
    return current
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return nil if @root.nil?
    return find_helper(@root, key)
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?
  
    if key < current_node.key
      return find_helper(current_node.left, key)
    elsif key > current_node.key
      return find_helper(current_node.right, key)
    elsif key == current_node.key
      return current_node.value
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return [] if @root.nil?
    return inorder_helper(@root, [])
  end

  def inorder_helper(current, values)
    return values if current.nil?

    inorder_helper(current.left, values)
    values.push({key: current.key, value: current.value})
    inorder_helper(current.right, values)
    return values
  end 



  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return [] if @root.nil?
    return preorder_helper(@root, [])
  end
  
  def preorder_helper(current, values)
    return values if current.nil?

    values.push({key: current.key, value: current.value})
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)
    return values
  end 

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return [] if @root.nil?
    return postorder_helper(@root, [])
  end

  def postorder_helper(current, values)
    return values if current.nil?

    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values.push({key: current.key, value: current.value})
    return values
  end 

  # Time Complexity: 
  # Space Complexity: 
  def height
    return 0 if @root.nil?
    return height_helper(@root)
  end

  def height_helper(current_node)
    return 0 if current_node.nil?
    
    left = height_helper(current_node.left) + 1
    right = height_helper(current_node.right) + 1

    return [left, right].max
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 


  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
