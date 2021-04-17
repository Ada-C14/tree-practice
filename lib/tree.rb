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

  # Time Complexity: O(log n) for balanced, O(n) for unbalanced
  # Space Complexity: O(log n) for balanced, O(n) for unbalanced
  def add(key, value = nil)
    if @root.nil? 
      @root = TreeNode.new(key, value)
    else
      add_helper(@root, key, value)
    end
  end

  def add_helper(current, key, value)
    if current.nil? 
      current = TreeNode.new(key, value)
    elsif key <= current.key 
      current.left = add_helper(current.left, key, value)
    else
      current.right = add_helper(current.right, key, value)
    end
    return current 
  end 

# iterative add helper 
  # def add_helper(current, key, value)
  #   added_to_tree = false 

  #   until added_to_tree
  #     if key <= current.key 
  #       next_node = current.left 
  #       if next_node.nil? 
  #         new_node = TreeNode.new(key, value)
  #         current.left = new_node
  #         added_to_tree = true 
  #       else
  #         current = current.left 
  #       end
  #     else
  #       next_node = current.right 
  #       if next_node.nil? 
  #         new_node = TreeNode.new(key, value)
  #         current.right = new_node
  #         added_to_tree = true 
  #       else
  #         current = current.right 
  #       end
  #     end
  #   end
  # end

  

  # Time Complexity: O(log n) for balanced, O(n) for unbalanced
  # Space Complexity: O(log n) for balanced, O(n) for unbalanced
  def find(key)
    find_helper(@root, key)
  end

  def find_helper(current, key)
    return nil if current.nil? 

    if current.key == key 
      return current.value
    elsif key < current.key 
      find_helper(current.left, key)
    else
      find_helper(current.right, key)
    end
  end

  # iterative find helper
  # def find_helper(current, key)
  #   return nil if current.nil? 
  #   found = false
  #   until found 
  #     if current.key == key 
  #       found = true 
  #       return current.value 
  #     else
  #       if key < current.key 
  #         current = current.left 
  #       else
  #         current = current.right 
  #       end
  #     end
  #     return nil if current.nil? 
  #   end
  # end

  # Time Complexity: O(n) to visit all nodes
  # Space Complexity: O(n) values array depends on how many nodes there are 
  def inorder
    values = []
    return inorder_helper(@root, values)
  end

  def inorder_helper(current, values)
    return values if current.nil?

    inorder_helper(current.left, values)
    values.push({key: current.key, value: current.value})
    inorder_helper(current.right, values)
    return values 
  end

  # Time Complexity: O(n) to visit all nodes
  # Space Complexity: O(n) values array depends on how many nodes there are 
  def preorder
    values = []
    return preorder_helper(@root, values)
  end

  def preorder_helper(current, values)
    return values if current.nil? 

    values.push({key: current.key, value: current.value})
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)
    return values
  end

  # Time Complexity: O(n) to visit all nodes
  # Space Complexity: O(n) values array depends on how many nodes there are 
  def postorder
    values = []
    return postorder_helper(@root, values)
  end

  def postorder_helper(current, values)
    return values if current.nil? 

    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values.push({key: current.key, value: current.value})
    return values
  end

  # Time Complexity: O(n) to visit all the nodes 
  # Space Complexity: O(log n) if balanced, O(n) if unbalanced
  def height
    height_helper(@root)
  end

  def height_helper(current)
    return 0 if current.nil? 

    left_height = height_helper(current.left)
    right_height = height_helper(current.right)

    return left_height > right_height ? left_height + 1 : right_height + 1 
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

#### testing ####
# tree = Tree.new
# tree.add(5, "Roshni")
# tree.add(3, "Test")
# tree.add(7, "Ada")
# tree.add(34, "Grace")
# tree.add(67, "Margaret")

# puts tree.root.value
# puts tree.root.left.value
# puts tree.root.right.value

# puts tree.inorder
# puts tree.preorder
# puts tree.postorder
# puts tree.height