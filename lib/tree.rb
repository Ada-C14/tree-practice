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

  # Time Complexity: Olog(n)
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root == nil
      @root = new_node
    else
      current_node = @root
      previouse_node = @root

      while current_node != nil
        previouse_node = current_node
        if key < current_node.key
          current_node = current_node.left
        else
          current_node = current_node.right
        end

        if key < previouse_node.key
          previouse_node.left = new_node
        else
          previouse_node.right = new_node
        end
      end

      return new_node
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find(key)
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

    find_helper(key, @root)
  end

   # Time Complexity: O(n)
  # Space Complexity: O(1)
  def inorder(current_node = @root, answer = [])
    return [] if current_node.nil?

    if current_node
      inorder(current_node.left, answer)
      answer.push({key: current_node.key, value: current_node.value})
      inorder(current_node.right)
    end

    return answer
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def preorder(current_node = @root, answer = [])
    return [] if current_node.nil?

    answer.push({key: current_node.key, value: current_node.value})
    preorder(current_node.right, answer)
    preorder(current_node.left)

    return answer
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def postorder(current_node = @root, answer = [])
    return [] if current_node.nil?

    postorder(current_node.left, answer)
    postorder(current_node.right)
    
    answer.push({key: current_node.key, value: current_node.value})

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
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
