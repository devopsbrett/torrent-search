require 'rails_helper'

RSpec.describe "torrents/edit", type: :view do
  before(:each) do
    @torrent = assign(:torrent, Torrent.create!(
      :name => "MyString",
      :link => "MyText"
    ))
  end

  it "renders the edit torrent form" do
    render

    assert_select "form[action=?][method=?]", torrent_path(@torrent), "post" do

      assert_select "input#torrent_name[name=?]", "torrent[name]"

      assert_select "textarea#torrent_link[name=?]", "torrent[link]"
    end
  end
end
