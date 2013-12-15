require 'spec_helper'

describe "instances/new" do
  before(:each) do
    assign(:instance, stub_model(Instance).as_new_record)
  end

  it "renders new instance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", instances_path, "post" do
    end
  end
end
