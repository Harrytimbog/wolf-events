class User < ApplicationRecord
  enum role: {viewer: "Viewer", chef: "Chef"}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: roles.keys }
  
end
