class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right
  
  def initialize(key, value)
    @key = key
    @value = value
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end
  
  # Time Complexity: Olog(n)
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end
  
  def add_helper(current, new_node)
    return new_node if current.nil?
    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end
    return current
  end
  
  # Time Complexity: Olog(n)
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?
    return @root.value if @root.key == key
    
    current = @root
    while current != nil
      if key == current.key
        return current.value
      elsif key < current.key
        current = current.left
      elsif key > current.key
        current = current.right
      end
    end
  end
  
  # Time Complexity: O(n) 
  # Space Complexity: O(n)
  def inorder
    return [] if @root.nil?
    list = []
    stack = []
    current = @root
    
  
    while !current.nil? || !stack.empty?
   
      while !current.nil?
        stack << current
        current = current.left
      end
      
      current = stack.pop
      list << {key: current.key, value: current.value}
      current = current.right
    end
    
    return list
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder 
    return [] if @root.nil?
    list = []
    stack = []
    current = @root
    
    stack.push(current)
    while !stack.empty?
      current = stack.pop
      list << {key: current.key, value: current.value}
      stack << current.right if current.right
      stack << current.left if current.left
    end
    
    return list
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n) 
  def postorder 
    return [] if @root.nil?
    
    list = []
    s1 = []
    s2 = []
    current = @root
    
    s1 << current
    while !s1.empty?
      current = s1.pop
      s2 << current
      s1 << current.left if current.left
      s1 << current.right if current.right
    end
    
    while !s2.empty?
      current = s2.pop
      list << {key: current.key, value: current.value}
    end
    
    return list
  end
  
  # Time Complexity: Olog(n)
  # Space Complexity: O(1)
  def height
    return 0 if @root.nil?
    return height_helper(@root)
  end
  
  def height_helper(current)
    if current.nil?
      return 0
    else
      return 1 + [height_helper(current.left), height_helper(current.right)].max
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