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
end
