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
end
