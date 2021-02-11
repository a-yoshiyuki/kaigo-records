class Customer < ApplicationRecord

  has_many :progress_records
  has_many :vital_records
  has_many :meal_records

  enum is_deleted: { 利用中: 0, 入院中: 1, 退所: 3 }

  def full_name
    self.first_name + "　" + self.last_name
  end

  def full_name_kana
    self.first_name_kana + "　" + self.last_name_kana
  end


end
