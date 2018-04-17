class Poll < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
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

def vote_counts_with_option_names
  vote_counts = self.vote_counts
  options = Hash.new

  options[self.option1] = vote_counts[:option1]
  options[self.option2] = vote_counts[:option2]
  options[self.option3] = vote_counts[:option3]
  options[self.option4] = vote_counts[:option4]
  options[self.option5] = vote_counts[:option5]
  options[self.option6] = vote_counts[:option6]

  options
end

# returns a hash with options and vote count
def vote_counts
  counts = {
    :option1 => 0,
    :option2 => 0,
    :option3 => 0,
    :option4 => 0,
    :option5 => 0,
    :option6 => 0
  }

  self.votes.each do |vote|
    if vote.option_num == "1"
      counts[:option1] += 1
    elsif vote.option_num == "2"
      counts[:option2] += 1
    elsif vote.option_num == "3"
      counts[:option3] += 1
    elsif vote.option_num == "4"
      counts[:option4] += 1
    elsif vote.option_num == "5"
      counts[:option5] += 1
    elsif vote.option_num == "6"
      counts[:option6] += 1
    end
  end

  return counts
end

private

# validates pictures size
def picture_size
  if picture.size > 5.megabytes
    errors.add(:picture, "Should be less than 5 megabytes")
  end
end

end