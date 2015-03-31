# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  artist      :string
#  artwork_url :string
#  title       :string
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Song, type: :model do
  describe '.queue' do
    context 'when empty' do
      subject { Song.queue.to_a }
      it { is_expected.to be_empty }
    end

    context 'when have deleted songs' do
      let!(:song1) { create(:song, deleted_at: nil) }
      let!(:song2) { create(:song, deleted_at: Time.zone.now) }
      subject { Song.queue.to_a }
      it { is_expected.to eq [song1] }
    end
  end
end
