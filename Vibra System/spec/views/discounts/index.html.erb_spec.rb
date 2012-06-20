require 'spec_helper'

describe "discounts/index" do
  before(:each) do
    assign(:discounts, [
      stub_model(Discount),
      stub_model(Discount)
    ])
  end

  it "renders a list of discounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
