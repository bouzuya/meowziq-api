class AddSongToStatus < ActiveRecord::Migration
  def change
    add_reference :statuses, :song, index: true, foreign_key: true
  end
end
