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
  pending "add some examples to (or delete) #{__FILE__}"
end
