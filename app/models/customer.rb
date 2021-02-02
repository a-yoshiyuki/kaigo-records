class Customer < ApplicationRecord

  has_many :progress_record
  has_many :vital_record
  has_many :meal_record

end
