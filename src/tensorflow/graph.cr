module TensorFlow
  class Graph
    property :graph
    @graph : LibTensorFlow::Graph
    @close : Bool

    def initialize
      @close = false
      @graph = LibTensorFlow.new_graph
    end

    def closed?
      @close
    end

    def destroy
      raise "Graph already destroyed" if @close
      @close = true
      LibTensorFlow.delete_graph(@graph)
    end

    # Alias Method
    def close
      destroy
    end

    def destroyed?
      closed?
    end
  end
end
