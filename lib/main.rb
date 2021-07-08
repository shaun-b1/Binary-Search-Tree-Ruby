# frozen_string_literal: true

require_relative 'binary_tree'
require_relative 'node'

array = (Array.new(15) { rand(1..100) })
tree = Tree.new(array)
puts 'Here is a binary tree: '
tree.pretty_print
puts "\n"
puts "\n"
puts 'Is this tree balanced?: '
puts tree.balanced?
puts "\n"
puts 'Print the tree in level order: '
puts tree.level_order
puts "\n"
puts 'Print the tree in preorder: '
puts tree.preorder
puts "\n"
puts 'Print the tree inorder: '
puts tree.inorder
puts "\n"
puts 'Print the tree in postorder'
puts tree.postorder
puts "\n"
sleep 10
puts 'Adding a bunch of numbers greater than 100...'
sleep 1
puts '3...'
sleep 1
puts '2...'
sleep 1
puts '1...'
sleep 1
16.times {tree.insert(rand(100..1000))}
puts 'Here is the tree now: '
tree.pretty_print
puts "\n"
puts "\n"
puts 'Is this tree balanced now?'
puts tree.balanced?
puts "\n"
sleep 10
puts "Let's rebalance it!"
puts '*Rebalancing*'
sleep 3
puts "\n"
puts "\n"
tree.rebalance
puts "Here is the tree in it's entirety:"
tree.pretty_print
puts "\n"
puts 'Is it balanced now?'
puts tree.balanced?
puts "\n"
puts 'Print the tree in level order: '
puts tree.level_order
puts "\n"
puts 'Print the tree in preorder: '
puts tree.preorder
puts "\n"
puts 'Print the tree inorder: '
puts tree.inorder
puts "\n"
puts 'Print the tree in postorder'
puts tree.postorder
