class CreateTorrents < ActiveRecord::Migration
  def change
    create_table :torrents do |t|
      t.string :name
      t.text :link

      t.timestamps null: false
    end
  end
end
