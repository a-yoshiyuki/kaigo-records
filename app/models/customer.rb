class Customer < ApplicationRecord

  has_many :progress_records
  has_many :vital_records
  has_many :meal_records

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true

  enum is_deleted: { 利用中: 0, 入院中: 1, 退所: 3 }

  def full_name
    self.first_name + "　" + self.last_name
  end

  def full_name_kana
    self.first_name_kana + "　" + self.last_name_kana
  end

  #def self.search(search)
    #if search
      #Customer.where(['first_name LIKE ? or last_name LIKE ? or first_name_kana LIKE ? or last_name_kana LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    #else
      #Customer.all
    #end
  #end


end
