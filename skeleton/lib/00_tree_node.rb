class PolyTreeNode
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    unless @parent.nil?
      @parent.children.delete(self)
      @parent = nil
    end
    @parent = node
    node.children += [self] if node
  end

  def children=(arr)
    @children = arr.uniq
  end

  def add_child(node)
    node.parent=(self)
  end

  def remove_child(node)
    raise "Not a child" unless @children.include?(node)
    @children.delete(node)
    node.parent=(nil)
  end


end
