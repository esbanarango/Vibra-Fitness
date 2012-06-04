require 'spec_helper'

describe "seats/edit" do
  before(:each) do
    @seat = assign(:seat, stub_model(Seat))
  end

  it "renders the edit seat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => seats_path(@seat), :method => "post" do
    end
  end
end
