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

require 'rails_helper'

RSpec.describe Status, type: :model do
  describe '#text' do
    it do
      is_expected.to validate_inclusion_of(:text).in_array(%w{stop play skip})
    end
  end
end
