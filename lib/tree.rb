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

  # Time Complexity: O(log n) if balanced, up to O(n) if unbalanced
  # Space Complexity: O(log n) if balanced, up to O(n) if unbalanced
  def add(key, value = nil)
    if @root.nil?
      @root = TreeNode.new(key,value)
    else
      add_helper(@root, key, value)
    end

  end

  def add_helper(current_node, key, value)
    if current_node.nil? 
      current_node = TreeNode.new(key, value)
    elsif key <= current_node.key 
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end

    return current_node
  end


  # Time Complexity: O(log n) if balanced, up to O(n) if unbalanced
  # Space Complexity: O(log n) if balanced, up to O(n) if unbalanced
  def find(key)
    if @root.nil?
      return nil
    else
      find_helper(@root, key)
    end
  end

  def find_helper(current_node, key)
    if current_node.nil? 
      return nil
    elsif current_node.key == key
      return current_node.value
    elsif key < current_node.key
      find_helper(current_node.left, key)
    else
      find_helper(current_node.right, key)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(current, values)
    return values if current.nil?

    inorder_helper(current.left, values)
    values << {key: current.key, value: current.value}
    inorder_helper(current.right, values)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(current, values)
    return values if current.nil?

    values << {key: current.key, value: current.value}
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)
  end


  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(current, values)
    return values if current.nil?

    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values << {key: current.key, value: current.value}
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return height_helper(@root)
  end

  def height_helper(current)
    return 0 if current.nil?

    return 1 + [height_helper(current.left), height_helper(current.right)].max
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
