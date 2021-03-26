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
  def add(key, value)
    new_node = TreeNode.new(value)
    if @root.nil?
      @root = new_node
    else 
      add_helper(@root, new_node)
    end 
  end

  def add_helper(current, new_node)
    if new_node.value <= current.value
      current.left = add_helper(current.left, new_node)
    elsif new_node.value >= current.value
      current.right = add_helper(curent.right, new_node)
    end 
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return nil if @root.nil?
    return find_helper(@root, key)
  end

  def find_helper(curent_node, key)
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
    values.push(current.value)
    inorder_helper(current.right, value)
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

    values.push(current.value)
    preorder_helper(current.left, values)
    preorder_helper(current.right, value)
    return values
  end 

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return [] if @root.nil?
    return inorder_helper(@root, [])
  end

  def postorder_helper(current, values)
    return values if current.nil?

    postorder_helper(current.left, values)
    postorder_helper(current.right, value)
    values.push(current.value)
    return values
  end 

  # Time Complexity: 
  # Space Complexity: 
  def height
    return nil if @root.nil?
    return height_helper(@root)

  end

  def height_helper(current_node)
    return 0 if current_node.nil?
    if height_helper(current_node.right) > height_helper(current_node.left)
      return 1 + height_helper(current_node.right)
    elsif height_helper(current_node.right) < height_helper(current_node.left)
      return 1 + height_helper(current_node.left)
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
