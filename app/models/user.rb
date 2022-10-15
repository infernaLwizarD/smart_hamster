class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :recoverable,
         :trackable, :validatable, :rememberable

  validates :email, :role_id, presence: true

  belongs_to :role
end
