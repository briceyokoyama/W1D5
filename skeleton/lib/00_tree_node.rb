require 'byebug'
class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(other_node)
        if @parent != nil
            @parent.children.delete(self)
            @parent = other_node
        end
        if other_node != nil
            @parent = other_node 
            other_node.children << self if !other_node.children.include?(self)
        end
        
    end

    def add_child(child_node)
        self.children << child_node if !self.children.include?(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Not a child" if !children.include?(child_node)
        child_node.parent = nil
        self.children.delete(child_node)
    end

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child|
            target_node = child.dfs(target_value)
            
        end

    end

    def inspect
        "<PolyNodeTree: value=#{self.value.inspect} parent=#{self.parent.inspect} children=#{self.children.inspect}>"
    end

end