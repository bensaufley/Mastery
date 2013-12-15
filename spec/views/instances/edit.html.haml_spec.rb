require 'spec_helper'

describe "instances/edit" do
  before(:each) do
    @instance = assign(:instance, stub_model(Instance))
  end

  it "renders the edit instance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", instance_path(@instance), "post" do
    end
  end
end
