# frozen_string_literal: true

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

  def min_value_node(node)
    current = node
    current = current.left until current.left.nil?
    current
  end

  def delete(data, root = self.root)
    return root if root.nil?

    if data < root.data
      root.left = delete(data, root.left)
    elsif data > root.data
      root.right = delete(data, root.right)
    else
      if root.left.nil?
        temp = root.right
        root = nil
        return temp
      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp
      else
        temp = min_value_node(root.right)
        root.data = temp.data
        root.right = delete(root.right, temp.data)
      end
    end
    root
  end

  def find(data, root = self.root)
    if root.nil? || root.data == data
      root
    elsif data < root.data
      find(data, root.left)
    else
      find(data, root.right)
    end
  end

  def level_order(root = self.root)
    if root.nil?
      nil
    else
      queue = []
      queue.push(root)
      until queue.empty?
        current = queue.first
        print "#{current.data}, "
        queue.push(current.left) unless current.left.nil?
        queue.push(current.right) unless current.right.nil?
        queue.delete_at(0)
      end
    end
  end

  def preorder(root = self.root)
    if root.nil?
      nil
    else
      print "#{root.data}, "
      preorder(root.left)
      preorder(root.right)
    end
  end

  def inorder(root = self.root)
    if root.nil?
      nil
    else
      inorder(root.left)
      print "#{root.data}, "
      inorder(root.right)
    end
  end

  def postorder(root = self.root)
    if root.nil?
      nil
    else
      postorder(root.left)
      postorder(root.right)
      print "#{root.data}, "
    end
  end
end
