class Role < ApplicationRecord
  has_many :users

  ADMIN = 1
  PARENT = 2
  HAMSTER = 3
end
