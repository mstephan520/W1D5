require "byebug"
class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        if self.parent == nil
            @parent = parent
            @parent.children << self unless parent == nil
        else
            self.parent.children.delete(self) 
            @parent = parent
            @parent.children << self unless parent == nil
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if @children.include?(child_node)
            child_node.parent = nil
        else
            raise "Node is not a child"
        end
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            found_node = child.dfs(target)
            return found_node unless found_node.nil?
        end
        nil  
    end

    def bfs(target)
        queue = []
        queue.push(self)
        until queue.empty?
            first = queue.shift
            if first.value == target
                return first
            else
                queue += first.children 
            end
        end
        nil        
    end

end

