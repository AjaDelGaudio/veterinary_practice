class Doctor < ActiveRecord::Base
  validates :name, presence: true
  validates_length_of :name, maximum: 35
  validates_length_of :zip, maximum: 5
  validates :years_in_practice, numericality: { only_integer: true }
  validates :years_in_practice, numericality: { less_than_or_equal_to: 100 }
  validates :years_in_practice, numericality: { greater_than_or_equal_to: 1 }
end
