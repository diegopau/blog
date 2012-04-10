# -*- encoding : utf-8 -*-
class AddErrorMessageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :error_message, :string

  end
end
