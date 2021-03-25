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
  # two subtrees, each carrying half its elements.  O(n) comes from the stack calls (worst case, again --
  # best case is O(log n) for a balanced tree).
  def find_helper(node, key)
    return nil if node.nil? 
  
    return node if node.key == key

    return find_helper(node.left, key) if key <= node.key
    return find_helper(node.right, key) if key > node.key
  end

  def find(key)
    node = find_helper(@root, key)

    return nil if node.nil?

    return node.value.nil? ? node.key : node.value
  end

  # Time Complexity: O(n) -- you only visit each node once. 
  # Space Complexity: O(n) -- Assuming the same array is passed down memory, I want to say it's O(n), simplified from O(2n).
  # The array is accounts for a hash created for each node.
  # The stack size will be the height of the tree, which doesn't exceed O(n)
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
  # Space Complexity: O(n) - Assuming the same array is passed down memory, simplified from O(2n).
  # The array is accounts for a hash created for each node.
  # basically the same as inorder. The stack size will be the height of the tree, which doesn't exceed O(n)
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
  # Space Complexity: O(n) Assuming the same array is passed down memory, simplified from O(2n).
  # The stack accounts for visiting every node once; the array is accounts for a hash created for each node.
  # basically the same as inorder. The stack size will be the height of the tree, which doesn't exceed O(n)
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
  # Time Complexity: O(n) ...? If we pretend the queue doesn't have an O(n) every time an element gets popped, O(n) -- all elements
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

  # Time Complexity: Worst case O(n) if every node has to be checked before it is found and deleted, best/average case O(log n) for a balanced BST.
  # Somewhere in between when deleting a node with both branches, where the branch to get the replacement node from has a lot of elements to its right,
  # I think... 

  # Space Complexity: Worst case O(n) in the stack to search all nodes for a node to delete (unbalanced), O(log n) for a balanced tree in the stack.
  # The same number of variables/arrays created for each call, and since an array isn't created until it's needed as a return variable it doesn't 
  # add additional complexity to the space complexity.
  def get_before_delete(node, key)
    
    return nil if node.nil? # not found

    return [nil, node, 'root'] if node.key == key # root needs to be deleted

    # return node before node to be deleted and node to delete
    # memory management would be nice here ... 
    if (key < node.key) # node to delete on left branch, else on right
      return node.left.key == key ? [node, node.left, 'left'] : get_before_delete(node.left, key) 
    else 
      return node.right.key == key ? [node, node.right, 'right'] : get_before_delete(node.right, key)
    end

  end

  def delete(key)

    return nil if @root.nil? # ignore empty trees

    # get node before one to delete, node to be delete, and which branch it's on
    # this allows us to include root in the same block of code instead of having
    # to do an entirely separate one
    before_delete_nodes, delete_node, branch = get_before_delete(@root, key) 

    return nil if delete_node.nil? # indicates not found

    # delete node will now hold the new node that before_delete_nodes connects to 
    
    # check leaf
    if(delete_node.left.nil? && delete_node.right.nil?)
      delete_node = nil
    # adopt branch if the other is empty 
    elsif (delete_node.left.nil?)
      delete_node = delete_node.right 
    elsif (delete_node.right.nil?)
      delete_node = delete_node.left
    # both branches have something
    # you can either swap with the right most node on the left branch
    # or the left most node on the right branch
    # we'll do the right most node on the left branch
    elsif (delete_node.left.right.nil?)
      delete_node.left.right = delete_node.right # prepare node with right branch
      delete_node = delete_node.left 
    else
      find_new_node = delete_node.left

      while(find_new_node.right.right)
        find_new_node = find_new_node.right 
      end
      
      # set up new node to adopt branches
      find_new_node.right.right = delete_node.right
      find_new_node.right.left = delete_node.left
      delete_node = find_new_node.right
      find_new_node.right = nil # remove this node from original spot
    end

    # use branch variable to assign new root/branches
    if branch == 'root'
      @root = delete_node
    elsif branch == 'left'
      before_delete_nodes.left = delete_node
    else 
      before_delete_nodes.right = delete_node 
    end
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end