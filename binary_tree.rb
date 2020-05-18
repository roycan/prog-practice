class Node

  # include comparable module
  include Comparable
  attr :data
  attr_accessor :data, :lchild, :rchild

  def initialize
    @data = nil
    @lchild = nil
    @rchild = nil
  end

  def <=>(other_node)
    return 1 if other_node.nil?
    return self.data <=> other_node.data
    return "cannot compare with nil"
  end

end



class Tree

attr_accessor :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)

    arr = arr.uniq.sort

    # find the middle element and make that the root node
    # half the array
    # set the left child to the middle of the left half
    # set the right child to the middle of the right half
    # this looks like a recursive algorithm

    if arr.length <= 1  # base case
      node = Node.new
      node.data = arr[0]
      puts "new node data: #{node.data}"
      return node
    end

    node = Node.new
    node.data = arr[arr.length/2]
    puts "new node data: #{node.data}"
    @root ||= node
    arr.delete_at(arr.length/2)
     larr = arr[0...(arr.length)/2]
     node.lchild = build_tree( larr ) unless larr.size == 0
     rarr = arr[arr.length/2...arr.length]
     node.rchild = build_tree(rarr) unless rarr.size == 0
    return node
  end

  def preorder(node, result = [])
    # this function outputs the preorder traversal of the binary Tree
    # this is necessary because I can't see the tree i'm creating past 3 nodes
    # it works by first having the root node as node
    # we have a results array where we shovel in the data as we pass them DLR
    # this is a recursive technique
    # i need a base case
    # when the stack is all traversed, we stop and return the results array


    p node
    p node.data
    p node.lchild
    p node.rchild
    p result
    result << node.data
    if node.lchild == nil && node.rchild == nil
      return result
    end
    preorder(node.lchild, result) unless node.lchild == nil
    preorder(node.rchild, result) unless node.rchild == nil

    return result

  end




end



n1 = Node.new
n1.data = "hello"
n2 = Node.new
n2.data = "world"
p n2 > n1
p t = Tree.new([1,2,3,4,5,6,7])
p t.preorder(t.root)
p t.root.data
p t.root.lchild.data
p t.root.rchild.data
p t.root.lchild.lchild.data
p t.root.lchild.rchild.data
p t.root.rchild.lchild.data
p t.root.rchild.rchild.data
