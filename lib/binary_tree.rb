class Tree
  attr_accessor :root

  def initialize(arr)
   @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    if arr.empty?
      return nil
    else
      mid = arr.length/2
      root = Node.new(arr[mid])
      root.left = build_tree(arr[0...mid])
      root.right = build_tree(arr[mid + 1 ...arr.length])
    end
    return root
  end

  def find(root = self.root, data)
    if root.nil? || root.data == data
      return root
    elsif data < root.data
      return find(root.left, data)
    else
      return find(root.right, data)
    end

  end
end 
