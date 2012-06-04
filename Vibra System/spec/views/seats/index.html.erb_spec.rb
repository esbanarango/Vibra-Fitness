require 'spec_helper'

describe "seats/index" do
  before(:each) do
    assign(:seats, [
      stub_model(Seat),
      stub_model(Seat)
    ])
  end

  it "renders a list of seats" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
