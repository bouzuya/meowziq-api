require 'rails_helper'

RSpec.describe 'statuses#show', type: :request do
  context 'without song' do
    let(:status) { create(:status) }
    before { get status_path(status) }
    subject { response }
    its(:status) { is_expected.to be 200 }
    its(:body) do
      is_expected.to match_json_expression(
        text: status.text,
        song: nil
      )
    end
  end

  context 'with song' do
    let(:status) { create(:status, :with_song) }
    before { get status_path(status) }
    subject { response }
    its(:status) { is_expected.to be 200 }
    its(:body) do
      is_expected.to match_json_expression(
        text: status.text,
        song: {
          id: status.song.id,
          artist: status.song.artist,
          title: status.song.title,
          url: song_url(status.song)
        }
      )
    end
  end
end
