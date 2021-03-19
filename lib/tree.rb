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
  #                  because the worst case scenario is to run thru the whole height of the binary tree to add a leave,
  #                  and it only takes half amount of the elements on the binary tree for searching.
  # Space Complexity: O(1), because the variables used is a constant.
  def add(key, value)
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
  #                  because the worst case scenario is to run thru the whole height of the binary tree to find a leave,
  #                  and it only takes half amount of the elements on the binary tree for searching.
  # Space Complexity: O(1), because the variables used is a constant. 
  def find(key)
    find = nil
    pointer = @root
    while pointer
      if pointer.key == key
        find = pointer.value
        break
      elsif pointer.key <= key
        pointer = pointer.right
      else
        pointer = pointer.left
      end
    end
    return find
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    raise NotImplementedError
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
