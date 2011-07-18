# == Schema Information
# Schema version: 20110708132857
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
#  provider   :string(255)
#

class User < ActiveRecord::Base
  # ATENCION!! voy a crear un usuario diferente para cada proveedor, sin preocuparme si resulta ser la misma persona accediendo desde dos proveedores distintos (por ejemplo facebook y twitter)
  # por lo tanto pueden haber dos usuarios llamados manolo garcia solo que uno esta asociado al proveedor facebook y otro al proveedor twitter... como el logueo solo se utiliza para dejar comentarios pues da igual!.

  has_one :authorization
  has_many :comments

  def self.create_from_hash!(hash)
    if !(hash['user_info']['urls']).empty?
      hash_with_websites = hash['user_info']['urls']  #urls is a hash containing key value pairs of an identifier for the website and its URL. For instance, an entry could be "Blog" => "http://intridea.com/blog"
      first_website_key = hash_with_websites.keys.at(1) #se coge la key del primer sitio web
      first_website_url = hash_with_websites[first_website_key]  #se coge el valor para esa key
      # puts "website: #{first_website_url}"
      create(:name => hash['user_info']['name'], :image_url => hash['user_info']['image'], :website => first_website_url)
    else
      puts "website: no habia ningun sitio web indicado!!"
      create(:name => hash['user_info']['name'], :image_url => hash['user_info']['image'], :website => nil)
    end
  end

end
