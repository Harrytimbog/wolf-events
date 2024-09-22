class EventPlace < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many_attached :photos

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :user, presence: true
  validates :category, presence: true

  # Custom validation to ensure only hosts or admins can create an event place
  validate :user_must_be_host_or_admin

  private

  def user_must_be_host_or_admin
    if user && !user.host? && !user.is_admin?
      errors.add(:user, "must be a Host or Admin to create an Event Place")
    end
  end
end
