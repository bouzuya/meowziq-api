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
  describe 'factories' do
    context 'with :status' do
      subject { build(:status) }
      it { is_expected.to be_valid }
      its(:song) { is_expected.to be nil }
    end

    context 'with :status, :with_song' do
      subject { build(:status, :with_song) }
      it { is_expected.to be_valid }
      its(:song) { is_expected.to_not be nil }
    end
  end

  describe '#text' do
    it do
      is_expected.to validate_inclusion_of(:text).in_array(%w{stop play skip})
    end
  end

  describe '#song' do
    it { is_expected.to belong_to(:song) }
  end
end
