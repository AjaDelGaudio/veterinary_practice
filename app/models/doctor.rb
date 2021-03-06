class Doctor < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { maximum: 35 }
  validates :zip, length: { maximum: 5 }
  validates :years_in_practice, numericality: { only_integer: true }
  validates :years_in_practice, numericality: { less_than_or_equal_to: 100 }
  validates :years_in_practice, numericality: { greater_than_or_equal_to: 1 }
end
