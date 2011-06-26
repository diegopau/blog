class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :user_name
      t.string :web_page
      t.text :contenido

      t.integer :post_id
      t.integer :user_id
      t.datetime :published_at

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
