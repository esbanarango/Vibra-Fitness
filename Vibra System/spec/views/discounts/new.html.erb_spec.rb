require 'spec_helper'

describe "discounts/new" do
  before(:each) do
    assign(:discount, stub_model(Discount).as_new_record)
  end

  it "renders new discount form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => discounts_path, :method => "post" do
    end
  end
end
