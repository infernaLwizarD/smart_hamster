class MathTraining < ApplicationRecord
  belongs_to :user

  validates :operations, presence: { message: 'Необходимо вырбать хотя бы одно арифметическое действие' }

  OPERATIONS = %w[plus minus multiplication division].freeze
end
