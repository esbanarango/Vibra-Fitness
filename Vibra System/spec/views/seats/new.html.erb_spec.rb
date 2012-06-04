require 'spec_helper'

describe "seats/new" do
  before(:each) do
    assign(:seat, stub_model(Seat).as_new_record)
  end

  it "renders new seat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => seats_path, :method => "post" do
    end
  end
end
