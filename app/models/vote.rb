class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll
  validates :user_id, presence: true
  validates :poll_id, presence: true
end
