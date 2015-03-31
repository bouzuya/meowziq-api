# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  song_id    :integer
#
# Indexes
#
#  index_statuses_on_song_id  (song_id)
#

FactoryGirl.define do
  factory :status do
    text "MyString"
  end

end
