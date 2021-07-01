require_relative 'binary_tree'
require_relative 'node'

x = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
p x.uniq.sort
tree = Tree.new(x)
p tree.find(4)
