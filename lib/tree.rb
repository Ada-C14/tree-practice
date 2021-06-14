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
  def add(key, value = 0)
    # there may or may not be a root
    # if there's no root then the key/value will be the new root
    # otherwise check to see if value is bigger or smaller than the root value
    # initialize new node with the key and value
    # check if it's smaller or larger and if it's the last node of the branch
    # if it's the last node then add it after that node
    input = TreeNode.new(key,value)
    if @root == nil 
      @root = input
      return
    else here = @root
    end
    while here != nil
      if input.key < here.key
        if here.left != nil
          here = here.left
        else here.left = input
          return
        end
      else input.key > here.key
        if here.right != nil
          here = here.right
        else here.right = input
          return
        end
      end
    end  
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    if @root.nil?
      return nil
    end
    here = @root
    while here != nil
      if here.key == key
        return here.value
      elsif key < here.key
          here = here.left
      elsif key > here.key
          here = here.right
      end
    end
    return nil
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    values = []
    if @root.nil?
      return values
    end
    return inorder_helper(@root, values)
  end

  def inorder_helper(here, values)
    if here.nil?
      return values
    end

    inorder_helper(here.left, values)
    values.push({:key=>here.key, :value=>here.value})
    inorder_helper(here.right, values)
    return values
  end


  # Time Complexity: 
  # Space Complexity: 
  def preorder
    values = []
    if @root.nil?
      return values
    end
    return preorder_helper(@root, values)
  end

  def preorder_helper(here, values)
    if here.nil?
      return values
    end
    
    values.push({:key=>here.key, :value=>here.value})
    preorder_helper(here.left, values)
    preorder_helper(here.right, values)
    
    return values
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    values = []
    if @root.nil?
      return values
    end
    return postorder_helper(@root, values)
  end

  def postorder_helper(here, values)
    if here.nil?
      return values
    end

    postorder_helper(here.left, values)
    postorder_helper(here.right, values)
    values.push({:key=>here.key, :value=>here.value})
    return values
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    height = 0
    if @root.nil?
      return height
    end
    return height_helper(@root)
  end
  
  def height_helper(here)
    if here.nil?
      return 0
    end
    return 1 + [height_helper(here.left), height_helper(here.right)].max
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
