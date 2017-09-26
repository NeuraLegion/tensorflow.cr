module TensorFlow
  class Status
    property :status
    @status : LibTensorFlow::Status

    def initialize
      @status = LibTensorFlow.new_status
    end

    def new_status
      @status = LibTensorFlow.new_status
    end

    def code : Int32
      code = LibTensorFlow.get_code(@status)
      code.to_i
    end

    def message : String
      String.new(LibTensorFlow.message(@status))
    end
  end
end
