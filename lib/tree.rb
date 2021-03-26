require 'set'

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
  # >> Assuming balanced BST, O(log n) time complexity (half the num nodes to check each time)
  # >> If not balanced, could be O(n)
  # Space Complexity: O(1)
  # >> keep track of current tree node
  def add(key, value = nil)
    return @root = TreeNode.new(key, value) if @root.nil?
    
    current = @root
    until current.nil?
      if key > current.key
        if !current.right
          current.right = TreeNode.new(key, value)
          return
        else
          current = current.right
        end
      else
        if !current.left
          current.left = TreeNode.new(key, value)
          return
        else
          current = current.left
        end
      end
    end
  end

  # Time Complexity: O(log n)
  # >> Assuming balanced BST, O(log n) time complexity (half the num nodes to check each time)
  # >> If not balanced, could be O(n)
  # Space Complexity: O(1)
  # >> Keep track of current node
  def find(key)
    return nil if @root.nil?

    current = @root
    until current.nil?
      return current.value if current.key == key

      current = if key > current.key
                  current.right
                else
                  current.left
                end
    end

    return nil
  end

  # Time Complexity: O(n)
  # >> hit every node in tree during traversal
  # Space Complexity: O(log n)
  # >> go down one side of tree at a time --> stack has height # of levels
  # >> O(n) if unbalanced
  def inorder
    return [] if @root.nil?

    nodes_arr = []
    inorder_helper(@root, nodes_arr)

    return nodes_arr
  end

  def inorder_helper(current, nodes_arr)
    return if current.nil?

    inorder_helper(current.left, nodes_arr)
    nodes_arr << { key: current.key, value: current.value }
    inorder_helper(current.right, nodes_arr)
  end

  # Time Complexity: O(n)
  # >> hit every node in tree during traversal
  # Space Complexity: O(log n)
  # >> go down one side of tree at a time --> stack has height # of levels
  # >> O(n) if unbalanced
  def preorder
    return [] if @root.nil?
    nodes_arr = []
    preorder_helper(@root, nodes_arr)

    return nodes_arr
  end

  def preorder_helper(current, nodes_arr)
    return if current.nil?

    nodes_arr << { key: current.key, value: current.value }
    preorder_helper(current.left, nodes_arr)
    preorder_helper(current.right, nodes_arr)
  end

  # Time Complexity: O(n)
  # >> hit every node in tree during traversal
  # Space Complexity: O(log n)
  # >> go down one side of tree at a time --> stack has height # of levels
  # >> O(n) if unbalanced
  def postorder
    return [] if @root.nil?
    nodes_arr = []
    postorder_helper(@root, nodes_arr)

    return nodes_arr
  end

  def postorder_helper(current, nodes_arr)
    return if current.nil?

    postorder_helper(current.left, nodes_arr)
    postorder_helper(current.right, nodes_arr)
    nodes_arr << { key: current.key, value: current.value }
  end

  # Time Complexity: O(n)
  # >> Go through every node in tree to confirm deepest level
  # Space Complexity: O(log n)
  # >> store set of unique levels / depths (log n)
  # >> store current node O(1)
  # >> store current height O(1)
  def height
    return 0 if @root.nil?

    heights = Set.new
    height_helper(@root, heights, 1)

    return heights.size
  end

  def height_helper(current, heights, curr_height)
    return if current.nil?

    heights << curr_height
    height_helper(current.left, heights, curr_height + 1)
    height_helper(current.right, heights, curr_height + 1)
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    return [] if @root.nil?

    bfs_nodes_arr = [{ key: @root.key, value: @root.value }]
    nodes_queue = Queue.new
    nodes_queue << @root

    until nodes_queue.empty?
      current_node = nodes_queue.deq

      if current_node.left
        bfs_nodes_arr << { key: current_node.left.key, value: current_node.left.value }
        nodes_queue << current_node.left
      end

      if current_node.right
        bfs_nodes_arr << { key: current_node.right.key, value: current_node.right.value }
        nodes_queue << current_node.right
      end
    end

    return bfs_nodes_arr
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
