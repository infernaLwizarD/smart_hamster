class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :recoverable, :registerable,
         :trackable, :validatable, :rememberable

  belongs_to :role

  validates :role_id, presence: true
  validates :username, :email, presence: true, uniqueness: true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validate :validate_username

  attr_writer :login

  before_save do
    self.username.downcase!
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  private

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
