class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
   end

   def to_pair
     return {:key=>@key, :value=>@value}
   end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n))
  def add(key, value = nil)
    @root = add_under_root(key, value, @root)
  end

  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n))
  def find(key)
    return find_under_root(key, @root)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    result = []
    in_order_under_root(@root, result)
    return result
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return pre_order_under_root(@root)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return post_order_under_root(@root)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(log(n))
  def height
    return height_under_root(@root)
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

private

  def add_under_root(key, value, root)
    if root.nil?
      root = TreeNode.new(key, value)
    elsif key >= root.key
      root.right = add_under_root(key, value, root.right)
    else
      root.left = add_under_root(key, value, root.left)
    end
    return root
  end

  def find_under_root(key, root)
    if root.nil?
      return nil
    elsif root.key == key
      return root.value 
    elsif key >= root.key
      find_under_root(key, root.right)
    else
      find_under_root(key, root.left)
    end
  end

  def in_order_under_root(root, result)
    if root.nil?
      return nil
    else
      if root.left != nil
        in_order_under_root(root.left, result)
      end

      result.push(root.to_pair)

      if root.right != nil
        in_order_under_root(root.right, result)
      end
    end
    return root
  end

  def pre_order_under_root(root)
    result = []
    if !root.nil?
      result.push(root.to_pair)
      result = result.concat(pre_order_under_root(root.left))
      result = result.concat(pre_order_under_root(root.right))
    end
    return result
  end

  def post_order_under_root(root)
    result = []
    if !root.nil?
      result = result.concat(post_order_under_root(root.left))
      result = result.concat(post_order_under_root(root.right))
      result.append(root.to_pair)
    end
    return result
  end

  def height_under_root(root)
    left_height = 0
    right_height = 0

    if root.nil?
      return 0
    else
      left_height = height_under_root(root.left)
      right_height = height_under_root(root.right)
    end
    return [left_height, right_height].max + 1


    # if root.nil?
    #   return 0
    # else
    #   return 1 + [height_under_root(root.left), height_under_root(root.right)].max
    # end
  end
end
