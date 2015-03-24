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

FactoryGirl.define do
  factory :song do
    artist "MyString"
artwork_url "MyString"
title "MyString"
deleted_at "2015-03-24 18:06:27"
  end

end
