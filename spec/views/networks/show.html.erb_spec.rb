require 'rails_helper'

RSpec.describe "networks/show", type: :view do
  before(:each) do
    @network = assign(:network, Network.create!(
      :address => "",
      :description => "MyText",
      :parent_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
