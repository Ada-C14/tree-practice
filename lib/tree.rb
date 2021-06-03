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

  # Time Complexity: O(log n) if balanced, otherwise O(n) where n is number of nodes
  # Space Complexity: O(n), n is height
  def add(key, value=nil)
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  def add_helper(curr_node, new_node)
    return new_node if curr_node.nil?

    if new_node.key <= curr_node.key
      curr_node.left = add_helper(curr_node.left, new_node)
    else
      curr_node.right = add_helper(curr_node.right, new_node)
    end

    return curr_node
  end  

  # Time Complexity: O(log n) if balanced
  # Space Complexity: O(n)
  def find(key)
    find_helper(@root, key)  #starts at root
  end

  def find_helper(current, key)
    return if current.nil?
    if key == current.key
      return current.value
    elsif key < current.key
      find_helper(current.left, key)
    else 
      find_helper(current.right, key)
    end
  end 

  # Time Complexity: O(n), n is number of nodes
  # Space Complexity: O(n)
  def inorder
    return inorder_helper(@root, [])
  end
  
  def inorder_helper(current, list)
    return list if current.nil?
    inorder_helper(current.left, list)
    list << {key: current.key, value: current.value}
    inorder_helper(current.right, list)
    return list
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(current, list)
    return list if current.nil?
    list << {key: current.key, value: current.value}
    preorder_helper(current.left, list)
    preorder_helper(current.right, list)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(current, list)
    return list if current.nil?
    postorder_helper(current.left, list)
    postorder_helper(current.right, list)
    list << {key: current.key, value: current.value}
  end

  # Time Complexity: 
  # Space Complexity: 
  def height(current = @root)
    return 0 if current.nil?
    return 1 if current.right.nil? && current.left.nil?

    left_count = 0
    right_count = 0
    left_count += 1 + height(current.left)
    right_count += 1 + height(current.right)
    left_count > right_count ? left_count : right_count
  end

  def height_helper(node, side, count)
    return count if node.nil?

    count += 1
    if side == 'left'
      height_helper(node.left, 'left', count)
    else
      height_helper(node.right, 'right', count)
    end
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    return [] if @root.nil?
    queue = []
    list = []
    queue.push(@root)
    while queue.length > 0
      current = queue[0]
      list << {key: current.key, value: current.value}
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right
      queue.shift
    end
    return list 
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
