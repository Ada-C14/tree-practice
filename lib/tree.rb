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
  # Space Complexity: O(n) for call stack
  def add(key, value = nil)
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
		elsif new_node.key > current.key
			current.right = add_helper(current.right, new_node)
		end

		return current
	end

  # Time Complexity: O(log n)
  # Space Complexity: O(n) for call stack
  def find(key)
		current = @root

		if current.nil?
			return nil
		else
			find_helper(current, key)
		end
  end

	def find_helper(current, key)
		return if current.nil?

		if key == current.key 
			return current.value
		elsif key <= current.key
			find_helper(current.left, key)
		else
			find_helper(current.right, key)
		end
	end

   # Time Complexity: O(n)
  # Space Complexity: O(n) for call stack
  def inorder
		values = []

		return inorder_helper(@root, values)
  end

	def inorder_helper(current, values)
		return values if current.nil?

		inorder_helper(current.left, values)
		values.push({ key: current.key, value: current.value })
		inorder_helper(current.right, values)

		return values
	end

  # Time Complexity: O(n)
  # Space Complexity: O(n) for call stack
  def preorder
    values = []

		return preorder_helper(@root, values)
  end

	def preorder_helper(current, values)
		return values if current.nil?

		values.push({ key: current.key, value: current.value })
		preorder_helper(current.left, values)
		preorder_helper(current.right, values)

		return values
	end

  # Time Complexity: O(n)
  # Space Complexity: O(n) for call stack
  def postorder
		values = []

		return postorder_helper(@root, values)
  end

	def postorder_helper(current, values)
		return values if current.nil?

		postorder_helper(current.left, values)
		postorder_helper(current.right, values)
		values.push({ key: current.key, value: current.value })
	end

	# Time Complexity: O(n)
  # Space Complexity: O(n) for call stack
  def height
    height_helper(@root)
  end

	def height_helper(current)
		return 0 if current.nil?

		left_subtree_height = height_helper(current.left)
		right_subtree_height = height_helper(current.right)

		if left_subtree_height > right_subtree_height
			return left_subtree_height + 1
		else
			return right_subtree_height + 1
		end
	end

  # Optional Method
	# Time Complexity: O(n)
  # Space Complexity: O(n) for queue
  def bfs 
		values = []

		return values if @root.nil?

		queue = Queue.new
		queue.enq(@root)

		while !queue.empty?
			# move down levels of tree by dequeuing 
			current = queue.deq

			values.push({key: current.key, value: current.value})

			# add left and right nodes of subtree to queue
			if current.left
				queue.enq(current.left)
			end

			if current.right
				queue.enq(current.right)
			end
		end

		return values
  end


  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end

	# in order traversal without recursion
	# https://www.techiedelight.com/find-inorder-predecessor-given-key-bst/#:~:text=To%20find%20which%20ancestors%20are,not%20exist%20for%20the%20node.
	# https://www.youtube.com/watch?v=wGXB9OWhPTg
	# Time Complexity: O(n)
  # Space Complexity: O(1)
	def morris_in_order_traversal
		values = []

		return values if @root.nil?

		current_node = @root

		while !current_node.nil?
			if current_node.left.nil?
				values.push(current_node.data)
				current_node = current_node.right
			else
				predecessor = find_predecessor(current_node)
				# if we're at the most right node, we make a link up to the current node
				if predecessor.right.nil?
					current_node.right = current_node
					current_node = current_node.left
				# if predecessor.right exists, this means we're hitting a link that we previously made 
				# this means we've already traversed this path / subtree
				# and now need to unlink it to restore the tree structure
				else
					predecessor.right = null
					values.push(current_node)
					current_node = current_node.right
				end
			end
		end

		return values

	end

	# to find predecessor of current node, start at current's left node and go all the way right
	def find_predecessor(current_node)
		current_node = current_node.left

		while current_node.right
			current_node = current_node.right
		end

		return current_node
	end
end
