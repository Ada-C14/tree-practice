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

  # Time Complexity: O(logn)
  # Space Complexity: O(logn)
  def add(key, value = nil)
    unless root
      @root = TreeNode.new(key, value)
    else
      add_helper(@root, key, value)
    end
  end

  def add_helper(current, key, value)
    return TreeNode.new(key, value) unless current

    if key < current.key
      current.left = add_helper(current.left, key, value)
    else
      current.right = add_helper(current.right, key, value)
    end

    # still working through why this needed/what would happen with no return
    return current
    # i think needed bc you assign current.left/right
    # to the return of add_helper
    # this assignment is needed because you will need
    # to connect the new node to a leaf node
    # (set that leaf node's .left/.right)
    # so for a given current node, you need to know what
    # it should be linked to (ie it's .left/right)
    # which means that on the next iteration, just return
    # that current's value to fill this in later
    # ^ bad explanation - but if current = 97, and current.left is 91
    # you need to return 91 on the next recursive call (when current is 91)
    # so that way when you work back up the callstack, you'll know that when
    # current is 97, set 97.left to be 91 (bc 91 is returned from helper(97.left))

    # if you didn't return current
    # just return -> going back up the callstack would be setting current.left/right to nil
    # no return -> i think bc of implicit returns in ruby, it would just carry the
    # assignment from the base case all the way up
    # so like in find for ex, once you find it, it just carries that val all the way up
    # when you're assigning, it takes the old leaf nodes assignment of .left/.right and just carries
    # that all the way up
    # this is why when i was playing around with it (without a return), in the case of adding a 3rd(+) node,
    # the code would just set what root.left/right's left/right to be the node i was adding
    # it basically takes that assignment from the base case and carries it all the way up

  end

  # Time Complexity: O(logn)
  # Space Complexity: O(logn)
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(current, key)
    return current unless current
    return current.value if key == current.key

    if current.key < key
      find_helper(current.right, key)
    else
      find_helper(current.left, key)
    end

    # why isnt a return needed here?
    # i think bc it just carries that return current all the way back up
    # implicit returns in ruby

  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    tree_in_order = []
    return inorder_helper(tree_in_order, @root)
  end

  def inorder_helper(tree, current)
    return tree unless current

    inorder_helper(tree, current.left)
    tree.push({:key=>current.key, :value=>current.value})
    inorder_helper(tree, current.right)

    return tree
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    tree_pre_order = []
    return preorder_helper(@root, tree_pre_order)
  end

  def preorder_helper(current, tree)
    return tree unless current

    tree.push({:key=>current.key, :value=>current.value})
    preorder_helper(current.left, tree)
    preorder_helper(current.right, tree)

    return tree
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    tree_post_order = []
    return postorder_helper(@root, tree_post_order)
  end

  def postorder_helper(current, tree)
    return tree unless current

    postorder_helper(current.left, tree)
    postorder_helper(current.right, tree)
    tree.push({:key=>current.key, :value=>current.value})

    return tree
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return height_helper(@root)
  end

  def height_helper(current)
    return 0 unless current

    left_height = height_helper(current.left)
    right_height = height_helper(current.right)

    return left_height < right_height ? right_height + 1 : left_height + 1
  end

  # Optional Method
  # Time Complexity: O(n^2)
  # Space Complexity: O(n)
  def bfs
    q = []
    tree_bfs = []
    return tree_bfs unless @root

    q.push(@root)
  
    until q.empty?
      current = q.shift

      tree_bfs.push({:key=>current.key, :value=>current.value})

      q.push(current.left) if current.left
      q.push(current.right) if current.right
    end

    return tree_bfs

  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end