class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(other_node)
        if other_node != nil 
            @parent = other_node
            other_node.children << self if !other_node.children.include?(self)
        else
            other_node.children.delete(self)
            @parent = other_node
            return nil
        end
    end
end