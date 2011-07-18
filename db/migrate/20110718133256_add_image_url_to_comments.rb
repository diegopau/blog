class AddImageUrlToComments < ActiveRecord::Migration
  def self.up
      add_column :comments, :image_url, :string  #no se usa de momento, resulta que se puede acceder al nombre del provider a traves del objeto authorization al que está asociado!.
  end

  def self.down
         remove_column :comments, :image_url
  end
end
