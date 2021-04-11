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
  # Space Complexity: O(1)
  def add_helper(key, value, current)
    if key <= current.key
      current.left ? add_helper(key, value, current.left) : current.left = TreeNode.new(key, value)
    else
      current.right ? add_helper(key, value, current.right) : current.right = TreeNode.new(key, value)
    end
  end

  def add(key, value = nil)
    if @root.nil?
      @root = TreeNode.new(key, value)
      return @root
    end
    add_helper(key, value, @root)
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find_helper(key, current)
    return nil if current.nil?
    return current.value if current.key == key
    if key < current.key
      find_helper(key, current.left)
    else key > current.key
      find_helper(key, current.right)
    end
  end

  def find(key)
    find_helper(key, @root)
  end

  # Time Complexity: 0(n) with n being number of nodes in the tree
  # Space Complexity: O(n)
  def inorder_helper(current, elements)
    return elements if current.nil?
    inorder_helper(current.left, elements)
    elements << {:key => current.key, :value => current.value}
    inorder_helper(current.right, elements)
  end

  def inorder
    inorder_helper(current = @root, elements = [])
  end

  # Time Complexity: 0(n) with n being number of nodes in the tree
  # Space Complexity: O(n)
  def preorder_helper(current, elements)
    return elements if current.nil?
    elements << {:key => current.key, :value => current.value}
    preorder_helper(current.left, elements)
    preorder_helper(current.right, elements)
  end


  def preorder
    preorder_helper(current = @root, elements = [])
  end

  # Time Complexity: 0(n) with n being number of nodes in the tree
  # Space Complexity: O(n)
  def postorder_helper(current, elements)
    return elements if current.nil?
    postorder_helper(current.left, elements)
    postorder_helper(current.right, elements)
    elements << {:key => current.key, :value => current.value}
  end

  def postorder
    postorder_helper(current = @root, elements = [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height_helper(current)
    return 0 if current.nil?
    return 1 + [height_helper(current.left), height_helper(current.right)].max 
  end
  
  def height
    height_helper(@root)
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
