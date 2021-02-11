class StaffMember < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :meal_records
         has_many :vital_records
         has_many :progress_records

  def full_name
    self.first_name + "　" + self.last_name
  end

  def full_name_kana
    self.first_name_kana + "　" + self.last_name_kana
  end

end
