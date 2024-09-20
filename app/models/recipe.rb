class Recipe < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :category
  has_many :favorites, dependent: :destroy

  # validations

  validates :title, :description, :ingredients, :instructions, :location, :prep_time, presence: true, uniqueness: true
  validates :user, :category, presence: true
  validate :user_must_be_chef
  
  private

  def user_must_be_chef
    if user && user.role != "Chef"
      errors.add(:user, "must be a Chef")
    end
  end
end
