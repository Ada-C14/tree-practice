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

  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n))
  def add(key, value = nil, current = @root)
    @root = TreeNode.new(key, value) and return if @root.nil?

    if key <= current.key
      current.left = TreeNode.new(key, value) and return if current.left.nil?
      add(key, value, current.left)
    else 
      current.right = TreeNode.new(key, value) and return if current.right.nil?
      add(key, value, current.right)
    end

  end

  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n))
  def find(key, current = @root)
    return nil if current.nil? 

    if key < current.key
      find(key, current.left)
    elsif key > current.key
      find(key, current.right)
    else
      return current.value
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder(current = @root, values = [])
    return values if current.nil?
    inorder(current.left, values)
    values << {:key => current.key, :value => current.value}
    inorder(current.right, values)

    return values
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder(current = @root, values = [])
    return values if current.nil?
    values << {:key => current.key, :value => current.value}
    preorder(current.left, values)
    preorder(current.right, values)
    return values
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder(current = @root, values = [])
    return values if current.nil?
    
    postorder(current.left, values)
    postorder(current.right, values)
    values << {:key => current.key, :value => current.value}
    return values
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height(current = @root)
    return 0 if current.nil? 

    return 1 + [height(current.left), height(current.right)].max
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
