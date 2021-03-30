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

  # Time Complexity: O(log(n)) assuming that the tree is balanced, binary search will eliminate half of tree every time, otherwise O(n) like linked list
  # Space Complexity: same as time complexity for stack calls
  def add(key, value = nil)
    @root = add_helper(@root, key, value)
  end

  def add_helper(current, key, value)
    if current.nil?
      current = TreeNode.new(key, value)
    elsif key <= current.key
      current.left = add_helper(current.left, key, value)
    else
      current.right = add_helper(current.right, key, value)
    end

    return current
  end

  # Time Complexity: O(log(n))/O(n)
  # Space Complexity: same as time complexity
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(current, key)
    return nil unless current
    if key == current.key
      return current.value
    elsif key < current.key
      find_helper(current.left, key)
    else
      find_helper(current.right, key)
    end
  end

  # Time Complexity:O(n) we traverse all the nodes once
  # Space Complexity:O(n) for stack calls + array space(O(2n)) 
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(node, array)
    return array unless node

    inorder_helper(node.left, array)
    array << { :key => node.key, :value => node.value }
    inorder_helper(node.right, array)
  end

  # Time Complexity:O(n) 
  # Space Complexity:O(n) 
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(node, array)
    return array unless node

    array << { :key => node.key, :value => node.value }
    preorder_helper(node.left, array)
    preorder_helper(node.right, array)
  end

  # Time Complexity:O(n) 
  # Space Complexity:O(n) 
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(node, array)
    return array unless node

    postorder_helper(node.left, array)
    postorder_helper(node.right, array)
    array << { :key => node.key, :value => node.value }
  end

  # Time Complexity: O(n) Have to traverse all the nodes once to find the one with the max height
  # Space Complexity:O(n) for stack calls
  def height
    height_helper(@root)
  end

  def height_helper(current)
    return 0 unless current

    left_ht = height_helper(current.left) + 1
    right_ht = height_helper(current.right) + 1
    return [left_ht, right_ht].max
  end

  # Optional Method
  # Time Complexity: O(n) traverse all the nodes once
  # Space Complexity: O(n^2) for array, queue and call stacks??? This can be done iteratively too with while loop. 
  def bfs
    bfs_helper([@root], [])
  end

  def bfs_helper(queue, array)
    return array if queue.empty? || @root.nil?
    current = queue.shift #select & remove 1st element in the queue
    array << { :key => current.key, :value => current.value }

    queue << current.left if current.left #push child into queue
    queue << current.right if current.right
    return bfs_helper(queue, array)
  end

  #http://www.mathcs.emory.edu/~cheung/Courses/171/Syllabus/9-BinTree/BST-delete2.html
  def delete(key)  
    return delete_helper(@root, key)
  end

  def delete_helper(current, key)
    return nil unless current
    
    if key < current.key #find key
      current.left = delete_helper(current.left, key)
    elsif key > current.key
      current.right = delete_helper(current.right, key)
    else
      if current.left.nil? && current.right.nil?  #no child, set key to nil
        current = nil?
      elsif current.left.nil? #1 child, replace current with child
        current = current.right
      elsif current.right.nil? 
        current = current.left
      else # 2 children, find min on the right subtree (or max on the left), replace and then delete
        min_right = find_min(current.right)
        current.key  = min_right.key
        current.value = min_right.value
        current.right = delete_helper(current.right, current.key)
      end
    end

    def find_min(node)
      #TODO Follow the left child in each branch until you reach a node that does not have a left child 
    end

  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
