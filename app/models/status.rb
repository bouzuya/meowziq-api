# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Status < ActiveRecord::Base
  validates :text, inclusion: %w{stop play skip}
end
