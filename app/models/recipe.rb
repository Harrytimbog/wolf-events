class Recipe < ApplicationRecord
  # Associations
  has_many_attached :photos
  belongs_to :user
  belongs_to :category
  has_many :favorites, dependent: :destroy

  # Validations
  validates :title, :description, :ingredients, :instructions, :location, :prep_time, presence: true
  validates :user, :category, presence: true
  validate :user_must_be_chef_or_admin

  private

  def user_must_be_chef_or_admin
    if user && !user.chef? && !user.is_admin?
      errors.add(:user, "must be a Chef or Admin to create a recipe")
    end
  end
end
