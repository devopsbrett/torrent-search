require 'rails_helper'

RSpec.describe "torrents/index", type: :view do
  before(:each) do
    assign(:torrents, [
      Torrent.create!(
        :name => "Name",
        :link => "MyText"
      ),
      Torrent.create!(
        :name => "Name",
        :link => "MyText"
      )
    ])
  end

  it "renders a list of torrents" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
