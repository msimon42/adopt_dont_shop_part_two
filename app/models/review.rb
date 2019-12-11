class Review < ApplicationRecord
  validates_presence_of :title, :content, :rating
  belongs_to :shelter

  def self.sort_by_rating
    order(rating: :desc)
  end

  def self.sort_by_date
    order(created_at: :desc)
  end
end
