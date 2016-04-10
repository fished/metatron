require 'rails_helper'

RSpec.describe "networks/edit", type: :view do
  before(:each) do
    @network = assign(:network, Network.create!(
      :address => "",
      :description => "MyText",
      :parent_id => 1
    ))
  end

  it "renders the edit network form" do
    render

    assert_select "form[action=?][method=?]", network_path(@network), "post" do

      assert_select "input#network_address[name=?]", "network[address]"

      assert_select "textarea#network_description[name=?]", "network[description]"

      assert_select "input#network_parent_id[name=?]", "network[parent_id]"
    end
  end
end
