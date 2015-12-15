class Pet < ActiveRecord::Base
  validates :name_of_pet, presence: true
  validates :name_of_pet, length: { maximum: 35 }
  validates :type_of_pet, inclusion: { in: ["Cat", "Dog", "Bird"] }
  validates :breed, presence: true
  validates :breed, length: { maximum: 35 }
  validates :age, presence: true
  validates :weight, presence: true
  validates :weight, numericality: { only_float: true }
  validates :date_of_last_visit, presence: true
end
