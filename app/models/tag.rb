# == Schema Information
# Schema version: 20110705205316
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts #cada tag puede pertenecer a muchos blogs (no solo a uno)
end
