class Collection < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  CATEGORIES = ['Books', 'Signs', 'Silverware', 'Other'].freeze

  validates :category, inclusion: { in: CATEGORIES }
end
