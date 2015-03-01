require 'rails_helper'

RSpec.describe "torrents/show", type: :view do
  before(:each) do
    @torrent = assign(:torrent, Torrent.create!(
      :name => "Name",
      :link => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
