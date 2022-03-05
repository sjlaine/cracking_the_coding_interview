#!/usr/bin/env ruby

require_relative 'tree.rb'

# Given a sorted array (increasing order) with unique integer elements, write an algorithm to create a binary search tree with minimal height

arr = [1, 4, 5, 11, 20, 21];

#     5
#    / \
#   4  20
#  /   / \
# 1   11  21

#      11
#     /  \
#    4    20
#   / \    \
#  1   5    21
#            \
#            25

one = Node.new(1)
four = Node.new(4)
five = Node.new(5)
eleven = Node.new(11)
twenty = Node.new(20)
twentyone = Node.new(21)
twentyfive = Node.new(25)

eleven.left = four
eleven.right = twenty
four.left = one
four.right = five
twenty.right = twentyone
# twentyone.right = twentyfive

tree = Tree.new(eleven)

levels = tree.count_levels(eleven)
puts "levels count: #{levels}"

tree.print_tree

# recursively build the tree starting with root, and choosing the root of the next branch every time

def shortest_bin_tree(arr)
  root = arr[(arr.length / 2).ceil]
  tree = new Tree(root)
end
