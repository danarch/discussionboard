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

class Vote < ActiveRecord::Base
  validates_presence_of :user, :article
  belongs_to :user
  belongs_to :article
end
