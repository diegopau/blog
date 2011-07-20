# == Schema Information
# Schema version: 20110718133256
#
# Table name: comments
#
#  id           :integer         not null, primary key
#  user_name    :string(255)
#  web_page     :string(255)
#  contenido    :text
#  post_id      :integer
#  user_id      :integer
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  image_url    :string(255)
#

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  #TODO: meter algunas validaciones para los comentarios
end
