# == Schema Information
#
# Table name: videos
#
#  id             :integer          not null, primary key
#  caption        :text
#  video          :string
#  viewed_by_user :boolean          default(FALSE)
#  views          :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Video < ApplicationRecord


  has_many(:comments, { :class_name => "Comment", :foreign_key => "video_id", :dependent => :destroy })

  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id" })

  
end
