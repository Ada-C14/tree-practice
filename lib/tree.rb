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

  # Time Complexity:
  # Space Complexity: 
  def add(key, value)
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


  # Time Complexity: 
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

  # Time Complexity: 
  # Space Complexity: 
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


  # def inorder
  #
  #   return [] if @root.nil?
  #
  #   current = @root
  #
  #   while current != nil
  #
  #   end
  #
  # end

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
