# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
