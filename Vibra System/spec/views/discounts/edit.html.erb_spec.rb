require 'spec_helper'

describe "discounts/edit" do
  before(:each) do
    @discount = assign(:discount, stub_model(Discount))
  end

  it "renders the edit discount form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => discounts_path(@discount), :method => "post" do
    end
  end
end
