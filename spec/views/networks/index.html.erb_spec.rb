require 'rails_helper'

RSpec.describe "networks/index", type: :view do
  before(:each) do
    assign(:networks, [
      Network.create!(
        :address => "",
        :description => "MyText",
        :parent_id => 1
      ),
      Network.create!(
        :address => "",
        :description => "MyText",
        :parent_id => 1
      )
    ])
  end

  it "renders a list of networks" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
