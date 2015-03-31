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
  describe '.next' do
    context 'when empty' do
      subject { Song.next }
      it { is_expected.to be nil }
    end

    context 'when have some songs' do
      let!(:song1) { create(:song, deleted_at: Time.zone.now) }
      let!(:song2) { create(:song, deleted_at: nil) }
      subject { Song.next }
      it { is_expected.to eq song2 }
    end
  end

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
