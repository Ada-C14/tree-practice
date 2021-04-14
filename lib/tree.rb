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

  # Time Complexity: O(log n)
  # Space Complexity: O(n) - call stack
  def add(key, value)
    if @root.nil?
      @root = TreeNode.new(key, value)
      return true
    end

    add_helper(key, value, @root)
  end

  def add_helper(key, value, current)
    return TreeNode.new(key, value) if current.nil?

    if key < current.key
      current.left = add_helper(key, value, current.left)
    else
      current.right = add_helper(key, value, current.right)
    end

    return current
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(n) - call stack
  def find(key, current = @root)
    return nil if current.nil?
    return current.value if current.key == key

    if key < current.key
      return find(key, current.left)
    else
      return find(key, current.right)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder(current = @root, answer = [])

    if current
      inorder(current.left, answer)
      answer.push({key: current.key, value: current.value})
      inorder(current.right, answer)
    end

    return answer
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder(current = @root, answer = [])
    if current
      answer.push({key: current.key, value: current.value})
      preorder(current.left, answer)
      preorder(current.right, answer)
    end

    return answer
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder(current = @root, answer = [])
    if current
      postorder(current.left, answer)
      postorder(current.right, answer)
      answer.push({key: current.key, value: current.value})
    end

    return answer
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height(current = @root)
    unless current
      return 0
    end

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

tree = Tree.new
tree.add(5, "Peter")
tree.add(3, "Paul")
tree.add(1, "Mary")
tree.add(10, "Karla")
tree.add(15, "Ada")
tree.add(25, "Kari")
puts tree.preorder