class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :recoverable, :registerable, :trackable, :validatable, :rememberable

  belongs_to :role

  validates :role_id, presence: true
  validates :username, :email, presence: true, uniqueness: true
  validates :username, format: { with: /^[a-zA-Z0-9_.]*$/, multiline: true }
  validate :validate_username

  attr_writer :login

  before_save do
    username.downcase!
  end

  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end

  def admin?
    role_id == Role::ADMIN
  end

  def parent?
    role_id == Role::PARENT
  end

  def hamster?
    role_id == Role::HAMSTER
  end

  private

  def validate_username
    errors.add(:username, :invalid) if exists?(email: username)
  end
end
