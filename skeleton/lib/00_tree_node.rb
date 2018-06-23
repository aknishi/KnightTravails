require 'byebug'

class PolyTreeNode
  attr_reader :value, :children, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    return if parent == node
    # if self already has parent remove self from parent's children
    parent.children.delete(self) unless parent.nil?
    # then set the new parent
    @parent = node
    @parent.children << self unless node.nil?
  end

  def remove_child(node)
    raise 'Node is not a child.' unless self.children.include?(node)
    node.parent = nil
  end

  def add_child(node)
    return if children.include?(node)
    node.parent = self
  end

  def dfs(target_value)
    return self if value == target_value
    children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      el = queue.shift
      return el if el.value == target_value
      queue.concat(el.children)
    end

    nil
  end
end
