require 'spec_helper'

describe "instances/show" do
  before(:each) do
    @instance = assign(:instance, stub_model(Instance))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
