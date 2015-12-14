class Doctor < ActiveRecord::Base
  validates :name, presence: true
  validates_length_of :name, maximum: 35
  validates_length_of :zip, maximum: 5
  validates :years_in_practice, numericality: true
end
