require 'spec_helper'

describe "activities/new" do
  before(:each) do
    assign(:activity, stub_model(Activity,
      :name => "MyString",
      :type => "",
      :private => false
    ).as_new_record)
  end

  it "renders new activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", activities_path, "post" do
      assert_select "input#activity_name[name=?]", "activity[name]"
      assert_select "input#activity_type[name=?]", "activity[type]"
      assert_select "input#activity_private[name=?]", "activity[private]"
    end
  end
end
