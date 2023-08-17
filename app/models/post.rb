class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :click_baity

  def click_baity
    return if title.blank?
    clickbait_phrases = ["Won't Believe", 'Secret', 'Top [number]', 'Guess']
    title_contains_clickbait = clickbait_phrases.any? { |phrase| title.include?(phrase) }
    errors.add(:title, 'Not clickbaity') unless title_contains_clickbait
  end
end
