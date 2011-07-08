# == Schema Information
# Schema version: 20110707124752
#
# Table name: idiomas
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Idioma < ActiveRecord::Base
  has_many :posts
end
