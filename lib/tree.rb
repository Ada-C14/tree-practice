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
  # Space Complexity: O(log n)
  def add(key, value = nil)
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    if @root.nil?
      return nil
    else
      return find_helper(@root, key)
    end
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

  def find_helper(current_node, key)
    if current_node.nil?
      return nil
    elsif key < current_node.key
      return find_helper(current_node.left, key)
    elsif key > current_node.key
      return find_helper(current_node.right, key)
    else
      return current_node.value
    end
  end

  def inorder_helper(current_node, array)
    if current_node
      inorder_helper(current_node.left, array)
      array << {key: current_node.key, value: current_node.value}
      inorder_helper(current_node.right, array)
    end
    return array
  end

  def preorder_helper(current_node, array)
    if current_node
      array << {key: current_node.key, value: current_node.value}
      preorder_helper(current_node.left, array)
      preorder_helper(current_node.right, array)
    end
    return array
  end

  def postorder_helper(current_node, array)
    if current_node
      postorder_helper(current_node.left, array)
      postorder_helper(current_node.right, array)
      array << {key: current_node.key, value: current_node.value}
    end
    return array
  end

  def height_helper(current_node)
    return 0 if current_node.nil?
    return 1 + [height_helper(current_node.right), height_helper(current_node.left)].max
  end

end
