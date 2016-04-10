require 'rails_helper'

RSpec.describe "networks/new", type: :view do
  before(:each) do
    assign(:network, Network.new(
      :address => "",
      :description => "MyText",
      :parent_id => 1
    ))
  end

  it "renders new network form" do
    render

    assert_select "form[action=?][method=?]", networks_path, "post" do

      assert_select "input#network_address[name=?]", "network[address]"

      assert_select "textarea#network_description[name=?]", "network[description]"

      assert_select "input#network_parent_id[name=?]", "network[parent_id]"
    end
  end
end
