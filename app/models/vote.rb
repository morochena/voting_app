class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll
  validates :user_id, presence: true
  validates :poll_id, presence: true
  validates :user_id, uniqueness: { scope: :poll_id,
  message: "You cant vote twice" }

end
