# == Schema Information
# Schema version: 20110707124752
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  website    :string(255)
#  image_url  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  # ATENCION!! voy a crear un usuario diferente para cada proveedor, sin preocuparme si resulta ser la misma persona accediendo desde dos proveedores distintos (por ejemplo facebook y twitter)
  # por lo tanto pueden haber dos usuarios llamados manolo garcia solo que uno esta asociado al proveedor facebook y otro al proveedor twitter... como el logueo solo se utiliza para dejar comentarios pues da igual!.

  has_one :authorization
  has_many :comments

  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'])
  end

end
