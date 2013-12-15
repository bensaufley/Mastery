require 'spec_helper'

describe "instances/index" do
  before(:each) do
    assign(:instances, [
      stub_model(Instance),
      stub_model(Instance)
    ])
  end

  it "renders a list of instances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
