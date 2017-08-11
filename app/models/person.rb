class Person < ApplicationRecord
  has_many :phone_numbers, dependent: :destroy
  validates :first_name, :last_name, presence: true
end
