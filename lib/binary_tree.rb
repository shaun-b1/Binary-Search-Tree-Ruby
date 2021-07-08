# frozen_string_literal: true

# Class definition for Tree objects, made up of many node objects
class Tree
  attr_accessor :root

  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2
    root = Node.new(arr[mid])
    root.left = build_tree(arr[0...mid])
    root.right = build_tree(arr[mid + 1...arr.length])

    root
  end

  def insert(data, root = self.root)
    if root.nil?
      root = Node.new(data)
    elsif data < root.data
      root.left = insert(data, root.left)
    else
      root.right = insert(data, root.right)
    end
    root
  end

  def delete(data, root = self.root)
    return root if root.nil?

    if data < root.data
      root.left = delete(data, root.left)
    elsif data > root.data
      root.right = delete(data, root.right)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      temp = min_value_node(root.right)
      root.data = temp.data
      root.right = delete(root.right, temp.data)
    end
    root
  end

  def find(data, root = self.root)
    return root if root.nil? || root.data == data

    data < root.data ? find(data, root.left) : find(data, root.right)
  end

  def level_order(root = self.root, queue = [])
    queue.push(root)
    until queue.empty?
      current = queue.first
      print "#{current.data} "
      queue.push(current.left) unless current.left.nil?
      queue.push(current.right) unless current.right.nil?
      queue.shift
    end
  end

  def preorder(root = self.root)
    return if root.nil?

    print "#{root.data} "
    preorder(root.left)
    preorder(root.right)
  end

  def inorder(root = self.root)
    return if root.nil?

    inorder(root.left)
    print "#{root.data} "
    inorder(root.right)
  end

  def postorder(root = self.root)
    return if root.nil?

    postorder(root.left)
    postorder(root.right)
    print "#{root.data} "
  end

  def height(root = self.root)
    unless root.nil? || root == self.root
      root = root.instance_of?(Node) ? find(root.data) : find(root)
    end

    return -1 if root.nil?

    [height(root.left), height(root.right)].max + 1
  end

  def depth(root = self.root, parent = self.root, edge = 0)
    return 0 if root == self.root
    return -1 if root.nil?

    if root < parent.data
      edge += 1
      depth(root, parent.left, edge)
    elsif root > parent.data
      edge += 1
      depth(root, parent.right, edge)
    else
      edge
    end
  end

  def balanced?(root = self.root)
    return true if root.nil?

    (height(root.left) - height(root.right)).abs <= 1 && balanced?(root.left) && balanced?(root.right) ? true : false
  end

  def rebalance
    @root = build_tree(create_inorder_array)
  end

  def pretty_print(root = @root, prefix = '', is_left = true)
    pretty_print(root.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if root.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{root.data}"
    pretty_print(root.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if root.left
  end

  protected

  def create_inorder_array(root = self.root, array = [])
    unless root.nil?
      create_inorder_array(root.left, array)
      array.push(root.data)
      create_inorder_array(root.right, array)
    end
    array
  end

  def min_value_node(node)
    current = node
    current = current.left until current.left.nil?
    current
  end
end
