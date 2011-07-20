# == Schema Information
# Schema version: 20110708132857
#
# Table name: posts
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  body         :text
#  published_at :datetime
#  language_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy # con :dependent indicamos que si un post se eliminan tb se eliminan todos sus comentarios
  has_and_belongs_to_many :tags
  belongs_to :language

  def to_param
    "#{id}-#{title.parameterize}"
  end
  # TODO: para añadir imagenes y almacenarlas habría que crear un modelo "imagen" perteneciente a post y que así un post pueda tener many imagenes.
end
