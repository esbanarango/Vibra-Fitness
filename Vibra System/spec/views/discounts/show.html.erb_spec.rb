require 'spec_helper'

describe "discounts/show" do
  before(:each) do
    @discount = assign(:discount, stub_model(Discount))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
