# == Schema Information
#
# Table name: bucketlists
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :bucketlist do
    title Faker::Hipster.word
  end
end