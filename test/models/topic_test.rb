# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  description :string(255)
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
