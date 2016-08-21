class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    if self.title && !self.title.match(/Won't Believe|Secret|Guess|Top \d/)
      errors.add(:title, "not clickbait")
      false
    end
  end
end
