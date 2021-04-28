require_relative '../../stacks-queues/lib/queue'

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
  attr_reader :root, :size
  def initialize
    @root = nil
    @size = 0
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def add(key, value)
    if @root.nil?
      @root = TreeNode.new(key, value)
    else
      current = @root
      prev = @root

      while current
        prev = current
        if key < current.key
          current = current.left
        else
          current = current.right
        end
      end
      if key < prev.key
        prev.left = TreeNode.new(key, value)
      else
        prev.right = TreeNode.new(key, value)
      end
    end
    @size += 1
  end

  # Time Complexity: worst case: O(n), best case: O(log n)
  # Space Complexity: O(1)
  def find(key)
    current = @root
    while current
      if current.key == key
        return current.value
      elsif key > current.key
        current = current.right
      else
        current = current.left
      end
    end
    return nil
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder(array=[], current=@root)
    return array if current == nil
    inorder(array, current.left)
    array << {key: current.key, value: current.value}
    inorder(array, current.right)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder(array=[],current=@root)
    return array if current.nil?
    array << {key: current.key, value: current.value}
    preorder(array, current.left)
    preorder(array, current.right)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder(array=[], current=@root)
    return array if current.nil?
    postorder(array, current.left)
    postorder(array, current.right)
    array << {key: current.key, value: current.value}
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height(current=@root)
    return 0 if current.nil?
    return 1 if current.right.nil? && current.left.nil?

    left_count = 0
    right_count = 0
    left_count += 1 + height(current.left)
    right_count += 1 + height(current.right)
    left_count > right_count ? left_count : right_count
  end

  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def bfs
    array = []
    return array if @root.nil?
    queue = [@root]
    while !queue.empty?
      current = queue.shift
      array << {key: current.key, value: current.value}
      unless current.left.nil?
        queue.push(current.left)
      end
      unless current.right.nil?
        queue.push(current.right)
      end
    end
    return array
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
