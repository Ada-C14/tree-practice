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
    # raise NotImplementedError
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
    else
      current.right = add_helper(current.right, new_node)
    end
    return current
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    return @root if @root.nil?

    current = @root

    until current.nil?
      if current.key == key
        return current.value
      elsif key <= current.key
        current = current.left
      else
        current = current.right
      end
    end

    return current
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    # raise NotImplementedError
    return [] if @root.nil?

    return inorder_helper(@root, [])
  end

  def inorder_helper(current, values)
    return values if current.nil?

    inorder_helper(current.left, values)
    values << { key: current.key, value: current.value }
    inorder_helper(current.right, values)
  end


  # Time Complexity: O(n)
  # Space Complexity:O(n)
  def preorder
    # raise NotImplementedError
    return [] if @root.nil?

    return preorder_helper(@root, [])
  end

  def preorder_helper(current, values)
    return values if current.nil?

    values << { key: current.key, value: current.value}
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)

    return values
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    # raise NotImplementedError
    return [] if @root.nil?

    return postorder_helper(@root, [])
  end

  def postorder_helper(current, values)
    return values if current.nil?

    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values << { key: current.key, value: current.value}

    return values
  end

  # Time Complexity:O(n)
  # Space Complexity:O(n)
  def height
    # raise NotImplementedError
    height_helper(@root, 0)
  end

  def height_helper(current, count)
    return count if current.nil?

    left = height_helper(current.left, count + 1)
    right = height_helper(current.right, count + 1)
    return [left, right].max
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
