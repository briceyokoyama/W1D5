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
        target_node = nil

        self.children.each do |child|

            kid = child.dfs(target_value)
            if kid != nil 
                target_node = kid 
                break
            end
            
        end
        return target_node
    end

    def bfs(target_value)
        queue = [self]

        while queue.length > 0
            eval = queue.shift
            if eval.value == target_value
               return eval
            else
                queue += eval.children
            end



        end  


    end

end