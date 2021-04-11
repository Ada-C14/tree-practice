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

  # Time Complexity: 
  # Space Complexity:
  def add(key, value = nil)
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  # Time Complexity: 
  # Space Complexity:
  def find(key)
    if @root.nil?
      return nil 
    else
      return find_helper(@root, key)
    end

  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return [] if @root.nil?
    return inorder_helper(@root, [])
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return [] if @root.nil?
    return preorder_helper(@root, [])
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return [] if @root.nil?
    return postorder_helper(@root, [])
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    return height_helper(@root)
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

private
  def add_helper(current_node, new_node)
    return new_node if current_node.nil?
    
    if new_node.key <= current_node.key
      current_node.left = add_helper(current_node.left, new_node)
    else 
      current_node.right = add_helper(current_node.right, new_node)
    end

    return current_node
  end

  def find_helper(node, key)
    if node.nil?
      return nil
    elsif node.key > key
      return find_helper(node.left, key)
    elsif node.key < key
      return find_helper(node.right, key)
    else
      return node.value
    end
  end

  def inorder_helper(node, array)
    if node
      inorder_helper(node.left, array)
      array << {key: node.key, value: node.value}
      inorder_helper(node.right, array)
    end
    return array
  end

  def preorder_helper(node, array)
    if node
      array << {key: node.key, value: node.value}
      preorder_helper(node.left, array)
      preorder_helper(node.right, array)
    end
    return array
  end

  def postorder_helper(node, array)
    if node
      postorder_helper(node.left, array)
      postorder_helper(node.right, array)
      array << {key: node.key, value: node.value}
    end
    return array
  end 

  def height_helper(node)
    return 0 if node.nil?
    return 1 + [height_helper(node.right), height_helper(node.left)].max
  end

end