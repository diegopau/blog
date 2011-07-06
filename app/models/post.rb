# == Schema Information
# Schema version: 20110617153416
#
# Table name: posts
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  body         :text
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy # con :dependent indicamos que si un post se eliminan tb se eliminan todos sus comentarios
  has_and_belongs_to_many :tags
end