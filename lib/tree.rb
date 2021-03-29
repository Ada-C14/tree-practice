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
  #                  because the worst case scenario is to visit the whole height of the binary tree to add a leaf,
  #                  otherwise, it only takes half amount of the elements on the binary tree for searching.
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
  #                  because the worst case scenario is to visit the whole height of the binary tree to find a leaf,
  #                  otherwise, it only takes half amount of the elements on the binary tree for searching.
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

  # Time Complexity: O(n), it has to visit every node in the tree, and n is the number of the nodes, so it's O(n).
  # Space Complexity: O(n), it calls stack and depends on the number of the nodes, also, the result stores every node in the tree, and n is the number of the nodes, so it's O(n).
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

  # Time Complexity: O(n), it has to visit every node in the tree, and n is the number of the nodes, so it's O(n).
  # Space Complexity: O(n), it calls stack and depends on the number of the nodes, also, the result stores every node in the tree, and n is the number of the nodes, so it's O(n).
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

  # Time Complexity: O(n), it has to visit every node in the tree, and n is the number of the nodes, so it's O(n).
  # Space Complexity: O(n), it calls stack and depends on the number of the nodes, also, the result stores every node in the tree, and n is the number of the nodes, so it's O(n).
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

  # Time Complexity: O(n), it has to visit every node in the tree, and n is the number of the nodes, so it's O(n).
  # Space Complexity: O(n), it calls stack and depends on the height of the tree, and n is the height, so it's O(n).
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
  # Time Complexity: O(n), it has to visit every node in the tree, and n is the number of the nodes, so it's O(n).
  # Space Complexity: O(n), the result stores every node in the tree, and n is the number of the nodes, so it's O(n).
  # queue way
  def bfs 
    result = []
    return result if @root.nil?
    
    queue = [@root]
    result = [{key: @root.key, value: @root.value}]
    while queue.length > 0
      node = queue.shift
      if node.left
        queue.push(node.left)
        result.push({key: node.left.key, value: node.left.value})
      end
      if node.right
        queue.push(node.right)
        result.push({key: node.right.key, value: node.right.value})
      end
    end
    return result
  end

  # recursion way
  # Time Complexity: O(n^2), it visits every node from level 1 to its level, and it would take (1+n)*n/2 for each node, and n is the height of the tree, so it's O(n^2).
  # Space Complexity: O(n), it calls stack, so if it's a balanced tree, it would be O(log n), n is the height of the tree; and if it's an unbalanced tree, the worst case scenario would be O(n). However, the result stores every node in the tree, and n is the number of the nodes, so it's O(n).
  def bfs_recursion
    height = height_helper(@root)
    result = []
    (1..height+1).each do |level|
      bfs_helper_node(@root, level, result)
    end
    return result
  end

  def bfs_helper_node(tree, level, result)
    if tree.nil?
      return result 
    elsif level == 1
      return result.push({key: tree.key, value: tree.value})
    else
      bfs_helper_node(tree.left, level-1, result)
      bfs_helper_node(tree.right, level-1, result)
    end
  end

  # Optional Method
  # Time Complexity: O(log n) for balanced tree/ O(n) for unbalanced tree,
  #                  because the worst case scenario is to visit the whole height of the binary tree to find a leaf and delete it, otherwise, it only takes half amount of the elements on the binary tree for searching and deleting.
  # Space Complexity: O(1), because the variables used is a constant. 
  # case 1. delete a node w/o children: remove the node from the tree
  # case 2. delete a node w/ a child: remove the node and replace it with its child
  # case 3. delete a node w/ 2 children: remove the node and rearrange the tree to replace the node
  #         take the pointer.right.left...left to replace it.
  def delete(key)
    return nil if find(key).nil?
    parent = nil
    pointer = @root
    while pointer && pointer.key != key
      parent = pointer
      if pointer.key < key
        pointer = pointer.right
      else
        pointer = pointer.left
      end
    end

    # case 1
    if pointer.left.nil? && pointer.right.nil?
      if pointer == @root
        @root = nil
      else
        if parent.left == pointer
          parent.left = nil
        else
          parent.right = nil
        end
      end
    #case 3
    elsif pointer.left && pointer.right
      replace_parent, replace_child = delete_helper(pointer)
      if replace_child.right
        replace_parent.left = replace_child.right
      end
      replace_child.left = pointer.left
      replace_child.right = pointer.right if replace_child != pointer.right
      if pointer == @root
        @root = replace_child
      else
        if parent.left == pointer
          parent.left = replace_child
        else
          parent.right = replace_child
        end
      end
    # case 2  
    else  
      if pointer.left
        child = pointer.left
      else
        child = pointer.right
      end
      if pointer == @root
        @root = child
      else
        if parent.left = pointer
          parent.left = child
        else
          parent.right = child
        end
      end
    end
  end

  # find the first right and then the leftmost leaf
  def delete_helper(tree)
    parent = tree
    replacement = tree.right
    while !replacement.left.nil?
      parent = replacement
      replacement = replacement.left
    end
    return parent, replacement
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
