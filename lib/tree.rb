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

  # Time Complexity: O(logn)
  # Space Complexity: O(logn)
  def add(key, value = nil)
    unless root
      @root = TreeNode.new(key, value)
    else
      add_helper(@root, key, value)
    end
  end

  def add_helper(current, key, value)
    return TreeNode.new(key, value) unless current

    if key < current.key
      current.left = add_helper(current.left, key, value)
    else
      current.right = add_helper(current.right, key, value)
    end

    return current

  end

  # Time Complexity: O(logn)
  # Space Complexity: O(logn)
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(current, key)
    return current unless current
    return current.value if key == current.key

    if current.key < key
      find_helper(current.right, key)
    else
      find_helper(current.left, key)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    tree_in_order = []
    return inorder_helper(tree_in_order, @root)
  end

  def inorder_helper(tree, current)
    return tree unless current

    inorder_helper(tree, current.left)
    tree.push({:key=>current.key, :value=>current.value})
    inorder_helper(tree, current.right)

    return tree
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    tree_pre_order = []
    return preorder_helper(@root, tree_pre_order)
  end

  def preorder_helper(current, tree)
    return tree unless current

    tree.push({:key=>current.key, :value=>current.value})
    preorder_helper(current.left, tree)
    preorder_helper(current.right, tree)

    return tree
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    tree_post_order = []
    return postorder_helper(@root, tree_post_order)
  end

  def postorder_helper(current, tree)
    return tree unless current

    postorder_helper(current.left, tree)
    postorder_helper(current.right, tree)
    tree.push({:key=>current.key, :value=>current.value})

    return tree
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return height_helper(@root)
  end

  def height_helper(current)
    return 0 unless current

    left_height = height_helper(current.left)
    right_height = height_helper(current.right)

    return left_height < right_height ? right_height + 1 : left_height + 1
  end

  # Optional Method
  # Time Complexity: O(n*m)
  # Space Complexity: O(n)
  def bfs
    q = []
    tree_bfs = []
    return tree_bfs unless @root

    q.push(@root)
  
    until q.empty?
      current = q.shift

      tree_bfs.push({:key=>current.key, :value=>current.value})

      q.push(current.left) if current.left
      q.push(current.right) if current.right
    end

    return tree_bfs

  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end