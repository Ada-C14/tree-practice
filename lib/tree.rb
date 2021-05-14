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

  # Time Complexity: o(n) or (log n)?
  # Space Complexity: o(n)
  def add(key, value = '')
    node = TreeNode.new(key, value)
    current_node = root
    if root.nil? 
      @root = node
    else
      # if true, new node is going to right of root
      while current_node
        if key > current_node.key
          if current_node.right.nil?
            current_node.right = node
            return
          end
          current_node = current_node.right
        else
          # new node is going to the left of root
          if current_node.left.nil?
            current_node.left = node
            return
          end
          current_node = current_node.left
        end
      end
    end
  end

  # Time Complexity: o(n) or (log n)?
  # Space Complexity: o(n)
  def find(key)
    current_node = @root
    return nil if current_node == nil

    while current_node != nil
      if key < current_node.key
        current_node = current_node.left
      elsif key > current_node.key
        current_node = current_node.right
      else
        return current_node.value
      end
    end

    return nil 

  end

  # Time Complexity: o(n)
  # Space Complexity: o(n)
  def inorder
    return [] if @root.nil?
    return inorder_helper(@root)
  end

  def inorder_helper(node)
    tree = []
    tree += inorder_helper(node.left) if node.left
    tree << {key: node.key, value: node.value}
    tree += inorder_helper(node.right) if node.right
    
    return tree

  end
  # Time Complexity: o(n)
  # Space Complexity: o(n)
  def preorder
    return [] if @root.nil?
    return preorder_helper(@root)

  end

  def preorder_helper(node)
    tree = []
    tree << {key: node.key, value: node.value}
    tree += preorder_helper(node.left) if node.left
    tree += preorder_helper(node.right) if node.right
    return tree
  end

  # Time Complexity: o(n)
  # Space Complexity: o(n)
  def postorder
    return [] if @root.nil?
    return postorder_helper(@root)
  end

  def postorder_helper(node)
    tree = []
    tree += postorder_helper(node.left) if node.left
    tree += postorder_helper(node.right) if node.right
    tree << {key: node.key, value: node.value}

    return tree
  end

  # Time Complexity: O(n)
  # Space Complexity: o(n)
  def height   # somewhere between log_2(N+1) and N
    return 0 if @root.nil?
    return height_helper(@root)
  end

  def height_helper(node)
    return 0 if node.nil?
    count = 1
    left_height = height_helper(node.left)
    right_height = height_helper(node.right)
    count += [right_height,left_height].max
    return count 
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    return [] if @root.nil?
    # raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
