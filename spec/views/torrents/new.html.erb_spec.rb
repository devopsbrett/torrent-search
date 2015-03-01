require 'rails_helper'

RSpec.describe "torrents/new", type: :view do
  before(:each) do
    assign(:torrent, Torrent.new(
      :name => "MyString",
      :link => "MyText"
    ))
  end

  it "renders new torrent form" do
    render

    assert_select "form[action=?][method=?]", torrents_path, "post" do

      assert_select "input#torrent_name[name=?]", "torrent[name]"

      assert_select "textarea#torrent_link[name=?]", "torrent[link]"
    end
  end
end
