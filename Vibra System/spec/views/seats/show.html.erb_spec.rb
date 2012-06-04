require 'spec_helper'

describe "seats/show" do
  before(:each) do
    @seat = assign(:seat, stub_model(Seat))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
