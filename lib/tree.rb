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
    # we have access to @root-instance variable of class tree because the below methods are class methods
    @root = nil
  end

  # Time Complexity: Olog(n)
  # Space Complexity: O(1)
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
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find(key)
    find_helper(key, @root)
  end

  def find_helper(key, current_node)
    if current_node.nil?
      return nil
    elsif key == current_node.key
      return current_node.value
    elsif key < current_node.key
      # look to the left
      find_helper(key, current_node.left)
    elsif key > current_node.key
      # look to the right
      find_helper(key, current_node.right)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def inorder(current_node = @root, answer = [])
    return answer if current_node.nil?

    if current_node
      inorder(current_node.left, answer)
      answer.push({ key: current_node.key, value: current_node.value })
      inorder(current_node.right, answer)
    end

    return answer
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def preorder(current_node = @root, answer = [])
    return answer if current_node.nil?

    answer.push({ key: current_node.key, value: current_node.value })
    preorder(current_node.left, answer)
    preorder(current_node.right, answer)

    return answer
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def postorder(current_node = @root, answer = [])
    return answer if current_node.nil?

    postorder(current_node.left, answer)
    postorder(current_node.right, answer)
    answer.push({ key: current_node.key, value: current_node.value })

    return answer
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height(current_node = @root)
    return 0 if current_node.nil?

    right_height = height(current_node.right)
    left_height = height(current_node.left)

    if right_height < left_height
      return left_height + 1
    else
      return right_height + 1
    end
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
  end

  def bfs_helper(current_node, answer)
    return answer if current_node.nil?
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
