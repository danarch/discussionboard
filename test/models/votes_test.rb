# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class VotesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
