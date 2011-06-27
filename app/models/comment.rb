# == Schema Information
# Schema version: 20110626115058
#
# Table name: comments
#
#  id           :integer         not null, primary key
#  user_name    :string(255)
#  web_page     :string(255)
#  contenido    :text
#  post_id      :integer
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
end
