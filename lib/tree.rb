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

  # Time Complexity: O(log n); although if the tree is not balanced, this could be O(n)
  # Space Complexity: O(1)
  def add(key, value = nil)
    if @root.nil?
      @root = TreeNode.new(key, value)
      return @root.value
    end

    current = @root

    while key <= current.key || key > current.key
      if key == current.key
        "This key is already taken."
      elsif key < current.key
        if current.left.nil?
          current.left = TreeNode.new(key,value)
          return value
        else
          current = current.left
        end
      else
        if current.right.nil?
          current.right = TreeNode.new(key,value)
          return value
        else
          current = current.right
        end
      end
    end

  end


  # Time Complexity: O(log n); although if the tree is not balanced, this could be O(n)
  # Space Complexity: 
  def find(key)
    current = @root
    while current != nil
      if current.key == key
        return current.value
      elsif current.key > key
        current = current.left
      elsif current.key < key
        current = current.right
      end
    end
    return nil
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    array = []
    current = @root
    inorder_helper(array, current)
  end

  def inorder_helper(array, current)
    return array if current.nil?

    #left
    inorder_helper(array, current.left)
    #middle
    array << {:key => current.key, :value => current.value}
    #right
    inorder_helper(array, current.right)

  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    array = []
    current = @root
    preorder_helper(array, current)
  end

  def preorder_helper(array, current)
    return array if current.nil?
    #middle
    array << {:key => current.key, :value => current.value}
    #left
    preorder_helper(array, current.left)
    #right
    preorder_helper(array, current.right)

  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    array = []
    current = @root
    postorder_helper(array, current)
  end

  def postorder_helper(array, current)
    return array if current.nil?

    #left
    postorder_helper(array, current.left)
    #right
    postorder_helper(array, current.right)
    #middle
    array << {:key => current.key, :value => current.value}

  end

  # Time Complexity: O(log n); although if the tree is not balanced, this could be O(n)
  # Space Complexity: O(1)
  def height
    height_helper(@root)
  end

  def height_helper(root)
    return 0 if root.nil?
    [1 + height_helper(root.left), 1 + height_helper(root.right)].max
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    # optional
  end


  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
