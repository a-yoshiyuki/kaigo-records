class Customer < ApplicationRecord

  has_many :progress_record
  has_many :vital_record
  has_many :meal_record

  enum is_deleted: { 利用中: 0, 入院中: 1, 退所: 3 }

  def full_name
    self.first_name + "　" + self.last_name
  end


end
