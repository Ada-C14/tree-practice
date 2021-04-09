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

  # Time Complexity: log(n)
  # Space Complexity: log(n)

  def add_helper(key, value, current)

    if current.key == key
      current.value = value
    elsif current.key > key
      if current.left == nil
        current.left = TreeNode.new(key,value)
      else
        add_helper(key, value, current.left)
      end
    else
      if current.right == nil
        current.right = TreeNode.new(key, value)
      else
        add_helper(key, value, current.right)
      end
    end

  end

  def add(key, value = nil)
    #what should I do to associate the value to the key when building the binaty tree search?
    if @root.nil?
      @root = TreeNode.new(key,value) #?? // what about the value?
      return @root
    else
      add_helper(key, value, @root)
    end

  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 

  def inorder(current = @root, values = [])  
    if current.nil?
      return values
    end

    inorder(current.left, values)
    values.push(current.value)
    inorder(current.right, values)
    return values
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

  # Time Complexity: o(n)
  # Space Complexity: O(h), where h = height
  def height(current = @root)
    return 0 if current.nil?
    
    left_child = height(current.left)
    right_child = height(current.right)

    if left_child > right_child
      return left_child + 1
    else
      return right_child + 1
    end

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
