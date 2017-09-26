require "./spec_helper"

describe TensorFlow::Graph do
  it "Initialize" do
    graph = TensorFlow::Graph.new
    graph.is_a?(TensorFlow::Graph).should eq(true)
  end

  it "Closes the graph" do
    graph = TensorFlow::Graph.new
    graph.destroy
    status = TensorFlow::Status.new
    status.code.should eq(0)
  end

  it "raise when close/destry is called twice" do
    expect_raises(Exception) do
      graph = TensorFlow::Graph.new
      graph.destroy
      graph.destroy
    end
  end
end
