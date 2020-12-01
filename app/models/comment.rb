# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  video_id   :integer
#
class Comment < ApplicationRecord

  belongs_to(:video, { :required => false, :class_name => "Video", :foreign_key => "video_id" })

  belongs_to(:author, { :required => false, :class_name => "User", :foreign_key => "author_id" })

end
