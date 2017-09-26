require "./spec_helper"

describe TensorFlow::Status do
  it "initialize" do
    status = TensorFlow::Status.new
    status.is_a?(TensorFlow::Status)
  end

  it "prints status number code" do
    status = TensorFlow::Status.new
    status.code.is_a?(Int32).should eq(true)
  end

  it "prints status message" do
    status = TensorFlow::Status.new
    puts status.message
    status.message.is_a?(String).should eq(true)
  end
end
