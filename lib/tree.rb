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
  # Space Complexity: ??
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

    if new_node.key == current.key
      current = new_node
    elsif new_node.key < current.key
      current.left = add_helper(current.left, new_node)
    elsif new_node.key > current.key
      current.right = add_helper(current.right, new_node)
    end
    return current
  end

  # Time Complexity: O(log n)
  # Space Complexity: ??
  def find(key)
    current = @root
    current.nil? ? return : find_helper(current, key)
  end

  def find_helper(current, key)
    if key < current.key
      find_helper(current.left, key)
    elsif key > current.key
      find_helper(current.right, key)
    else
    return current.value
    end
  end

  # Time Complexity: O(n) Where n is the number of nodes in the tree. The algorithm visits each node exactly once
  # And due to the worst case when the tree becomes unbalanced
  # Space Complexity: O(n)
  def inorder
    values = []
    return inorder_helper(@root, values)
  end

  def inorder_helper(current, values)
    return values if current.nil?

    inorder_helper(current.left, values)
    values.push({ key: current.key, value: current.value })
    inorder_helper(current.right, values)

    return values
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    values = []
    return preorder_helper(@root, values)
  end

  def preorder_helper(current, values)
    return values if current.nil?

    values.push({ key: current.key, value: current.value })
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    values = []
    return postorder_helper(@root, values)
  end

  def postorder_helper(current, values)
    return values if current.nil?

    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values.push({ key: current.key, value: current.value })
  end

  # Time Complexity: O(n)
  # Space Complexity: ??
  def height
    height_helper(@root)
  end

  def height_helper(current)
    return 0 if current.nil?

    leftHeight = height_helper(current.left)
    rightHeight = height_helper(current.right)

    if leftHeight > rightHeight
      return leftHeight + 1
    else
      return rightHeight + 1
    end
  end


  # Optional Method
  # Time Complexity: ??
  # Space Complexity: ??
  # def bfs(current)
  #   values = []
  #   values.push(current)
  #
  #   while (values.size != 0)
  #
  #     n = values.shift
  #     puts n.values
  #     n.children.each do |child|
  #       values.push(child)
  #     end
  #   end
  # end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
