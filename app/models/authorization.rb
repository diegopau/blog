# == Schema Information
# Schema version: 20110626101947
#
# Table name: authorizations
#
#  id         :integer         not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Authorization < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, user = nil)
    user = User.create_from_hash!(hash)  #La admiracion al final de un metodo puede significar que va a modificar el objeto mismo, por lo cual se considera algo peligroso, o simplemente puede dar información de que ese metodo hace algo inusual.. lo utilizan los desarrolladores para "adornar" y dar mas informacion sobre el metodo.
    Authorization.create(:user => user, :uid => hash['uid'], :provider => hash['provider'])
  end

  def self.find_from_user_id(user_id)
    find_by_user_id(user_id)
  end
end
