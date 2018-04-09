class Poll < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  mount_uploader :option1_picture, OptionPicsUploader
  mount_uploader :option2_picture, OptionPicsUploader
  mount_uploader :option3_picture, OptionPicsUploader
  mount_uploader :option4_picture, OptionPicsUploader
  mount_uploader :option5_picture, OptionPicsUploader
  mount_uploader :option6_picture, OptionPicsUploader
  validates :user_id, presence: true
  validates :title, presence: true
  validate :picture_size
end

private

# validates pictures size
def picture_size
  if picture.size > 5.megabytes
    errors.add(:picture, "Should be less than 5 megabytes")
  end
end