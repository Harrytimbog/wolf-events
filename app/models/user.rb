class User < ApplicationRecord
  has_one_attached :photo

  enum role: { viewer: "Viewer", chef: "Chef" } # Define roles

  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: roles.keys }
end
