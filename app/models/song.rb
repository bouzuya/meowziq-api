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

class Song < ActiveRecord::Base
  def self.next
    queue.first
  end

  def self.queue
    where(deleted_at: nil).order(id: :asc)
  end

  def dir
    "#{Rails.root}/public/music"
  end

  def path
    "#{dir}/#{id}"
  end

  def save_file file
    FileUtils.mkdir_p dir
    FileUtils.cp file, "#{dir}/#{id}"
  end
end
