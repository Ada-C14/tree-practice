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

  # Time Complexity: O(log n) for balanced tree/ O(n) for unbalanced tree,
  #                  because the worst case scenario is to run thru the whole height of the binary tree to add a leaf,
  #                  and it only takes half amount of the elements on the binary tree for searching.
  # Space Complexity: O(1), because the variables used is a constant.
  def add(key, value = nil)
    return @root = TreeNode.new(key, value) if @root.nil?

    pointer = @root
    previous = nil
    while pointer
      previous = pointer
      if pointer.key <= key
        pointer = pointer.right
      else
        pointer = pointer.left
      end
    end 

    if previous.key <= key
      previous.right = TreeNode.new(key, value)
    else
      previous.left = TreeNode.new(key, value)
    end
    return @root
  end

  # Time Complexity: O(log n) for balanced tree/ O(n) for unbalanced tree,
  #                  because the worst case scenario is to run thru the whole height of the binary tree to find a leaf,
  #                  and it only takes half amount of the elements on the binary tree for searching.
  # Space Complexity: O(1), because the variables used is a constant. 
  def find(key)
    find = nil
    pointer = @root
    while pointer
      if pointer.key == key
        find = pointer.value
        break
      elsif pointer.key < key
        pointer = pointer.right
      else
        pointer = pointer.left
      end
    end
    return find
  end

  # Time Complexity: 
  # Space Complexity: 
  # left/root/right
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(root, result)
    return result if root.nil? 
    inorder_helper(root.left, result)
    result.push({key: root.key, value: root.value})
    inorder_helper(root.right, result)
  end

  # Time Complexity: 
  # Space Complexity: 
  # root/left/right
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(root, result)
    return result if root.nil? 
    result.push({key: root.key, value: root.value})
    preorder_helper(root.left, result)
    preorder_helper(root.right, result)
  end

  # Time Complexity: 
  # Space Complexity: 
  # left/right/root
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(root, result)
    return result if root.nil? 
    postorder_helper(root.left, result)
    postorder_helper(root.right, result)
    result.push({key: root.key, value: root.value})
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    return height_helper(@root)
  end

  def height_helper(root)
    return 0 if root.nil?
    right = height_helper(root.right)
    left = height_helper(root.left)
    return 1 + (left > right ? left : right)
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    return bfs_helper(@root, [])
  end

  def bfs_helper(root, result)
    return result if root.nil?
    result.push({key: root.key, value: root.value})
    left = bfs_helper(root.left, result)
    right = bfs_helper(root.right, result)
    return result
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
