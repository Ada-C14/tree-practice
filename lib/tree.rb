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

  # Time Complexity: O(n) worst case if you have to travel through entire list,
  # average case should be about O(log n) since you only need to travel half of each subtree
  # based on comparing with their keys.

  # Space Complexity: O(n) worst case to have to search entire tree, which accumulates up to 
  # <#nodes in tree> in the stack. again, comparing in a more balanced tree would probably
  # put it at around O(log n) for every recursive call. You only add one node each call.
  def add_helper(node, key, value = nil)

    if node.nil?
      node = TreeNode.new(key, value)
    elsif node.key >= key 
      node.left = add_helper(node.left, key, value)
    elsif node.key < key
      node.right = add_helper(node.right, key, value)
    end

    return node
  end

  def add(key, value = nil)
    @root = add_helper(@root, key, value)
  end

  # Time Complexity: O(n) worst case if you have to travel through entire list,
  # average case should be about O(log n) since you only need to travel half of each subtree
  # based on comparing with their keys.

  # Space Complexity: This is still O(n) since worst case is again, having to search all the nodes
  # by traveling the same branch, and O(log n) for a more balanced tree where each tree branches into 
  # two subtrees, each carrying half its elements.  O(n) comes from the stack calls.
  def find_helper(node, key)
    return nil if node.nil? 
    
    returnVal = node.value.nil? ? node.key : node.value

    return returnVal if node.key == key

    return find_helper(node.left, key) if key <= node.key
    return find_helper(node.right, key) if key > node.key
  end

  def find(key)
    return find_helper(@root, key)
  end

  # Time Complexity: O(n) -- you only visit each node once. 
  # Space Complexity: Assuming the same array is passed down memory, I want to say it's O(n), simplified from O(2n).
  # The stack accounts for visiting every node once; the array is accounts for a hash created for each node.
  def inorder_helper(node, array)
    if node
      inorder_helper(node.left, array)
      array<< {:key=> node.key, :value=> node.value}
      inorder_helper(node.right, array)
    end

    return array
  end

  def inorder
    return inorder_helper(@root, [])
  end

  # Time Complexity: O(n) -- you only visit each node once. 
  # Space Complexity: Assuming the same array is passed down memory, simplified from O(2n).
  # The stack accounts for visiting every node once; the array is accounts for a hash created for each node.
  # basically the same as inorder.
  def preorder_helper(node, array)
    if node
      array << {:key=> node.key, :value=> node.value}
      preorder_helper(node.left, array)
      preorder_helper(node.right, array)
    end

    return array
  end

  def preorder
    return preorder_helper(@root, [])
  end

  # Time Complexity: O(n) -- you only visit each node once. 
  # Space Complexity: Assuming the same array is passed down memory, simplified from O(2n).
  # The stack accounts for visiting every node once; the array is accounts for a hash created for each node.
  # basically the same as inorder.
  def postorder_helper(node, array)
    if node
      postorder_helper(node.left, array)
      postorder_helper(node.right, array)
      array << {:key=> node.key, :value=> node.value}
    end

    return array
  end

  def postorder
    return postorder_helper(@root, [])
  end

  # Time Complexity: O(n) - You have to visit every node once, even though you are only actually counting the number of levels 
  # in the tree and not the nodes themselves, to confirm the height of each sub-tree. 

  # Space Complexity: O(n) - Since you are checking every node per call/recursive call, each node gets its own 
  # entry in the stack. 
  def height_helper(node)
    if node
      left = 1 + height_helper(node.left)
      right = 1 + height_helper(node.right)

      return left > right ? left : right
    else 
      return 0
    end
  end

  def height
    return height_helper(@root)
  end

  # Optional Method
  # Time Complexity: If we pretend the queue doesn't have an O(n) every time an element gets popped, O(n) -- all elements
  # are operated on at most thrice to enqueue, pop, and load element into the return array. My guess is that even with 
  # adding to the end of the array is always an O(n) operation, but the the shifting would be O(n^2) given that a balanced
  # tree would have 2 nodes pushed in for every node pushed out, so every loop you are shifting an array with one element 
  # more than the last. I just made a Queue object to be on the safe side. 

  # Space Complexity: O(n) for two arrays that have max of length O(n) for all function calls -- one being the return array containing
  # all the elements, the other being the queue
  def bfs
    array = []
    return array if @root.nil?

    array << {:key=> @root.key, :value=> @root.value}

    # load a queue
    queue = Queue.new
    queue << @root.left if @root.left
    queue << @root.right if @root.right

    until queue.empty? 
      cur = queue.shift 
      array << {:key=> cur.key, :value=> cur.value}
      queue << cur.left if cur.left
      queue << cur.right if cur.right

    end

    return array
  end

  # Time Complexity: 
  # Space Complexity: 

  def delete(key)
    node = find(key)

    if node 

    end
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
