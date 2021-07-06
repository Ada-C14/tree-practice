def add(key, value = nil)
  new_node = TreeNode.new(key, value)
  if @root.nil?
    @root = new_node
  else
    add_helper(@root, new_node)
  end
end

def add_helper(parent, new_node)
  if parent.nil?
    return new_node
  end

  if new_node.key <= parent.key
    # If left is nil, add new node to left, if not continue to evaluate.
    parent.left.nil? ? parent.left = new_node : add_helper(parent.left, new_node)
  else
    parent.right.nil? ? parent.right = new_node : add_helper(parent.right, new_node)
  end

  

  # if @root == nil
  #   @root = new_node
  # else
  #   current_node = @root
  #   previous_node = @root

  #   while current_node != nil
  #     previous_node = current_node
  #     if key <= current_node.key
  #       current_node = current_node.left
  #     else
  #       current_node = current_node.right
  #     end

  #     if key < previous_node.key
  #       previous_node.left = new_node
  #     else
  #       previous_node.right = new_node
  #     end
  #   end

  # return new_node
  # end
end

def add(key, value = nil)
  new_node = TreeNode.new(key, value)

  if @root == nil
    @root = new_node
  end

  current_node = @root
  if new_node.key <= current_node.key
    current_node.left.nil? ? current_node.left = new_node : add(current_node.left, new_node.value)
  else
    current_node.right.nil? ? current_node.right = new_node : add(current_node.right, new_node.value)
  end
end