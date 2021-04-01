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

  # Time Complexity: O(log n) if balanced, O(n) if a linked-list type BST
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    @root = add_helper(root, new_node)
  end

  def add_helper(current, new_node)
    return new_node if current.nil?

    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end

    return current
  end 

  # Time Complexity: O(log n) if balanced, O(n) if a linked-list type BST
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?

    current = @root
    found = false

    while !found
      if key < current.key
        current = current.left
      elsif key > current.key
        current = current.right 
      else
        return current.value
        found = true
      end
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return inorder_helper(root)
  end

  def inorder_helper(node)
    bst_inorder = []

    if node.nil?
      node = @root
    end

    return bst_inorder if node.nil?

    bst_inorder += inorder_helper(node.left) if node.left # a
    bst_inorder << { key: node.key, value: node.value }
    bst_inorder += inorder_helper(node.right) if node.right

    return bst_inorder
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return preorder_helper(root)
  end

  def preorder_helper(node)
    bst_preorder = []

    if node.nil?
      node = @root
    end

    return bst_preorder if node.nil?

    bst_preorder << { key: node.key, value: node.value }
    bst_preorder += preorder_helper(node.left) if node.left
    bst_preorder += preorder_helper(node.right) if node.right

    return bst_preorder
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return postorder_helper(root)
  end

  def postorder_helper(node)
    bst_postorder = []

    if node.nil?
      node = @root
    end

    return bst_postorder if node.nil?

    bst_postorder += postorder_helper(node.left) if node.left
    bst_postorder += postorder_helper(node.right) if node.right
    bst_postorder << { key: node.key, value: node.value }

    return bst_postorder
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    raise NotImplementedError
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
