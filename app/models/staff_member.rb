class StaffMember < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :meal_record
         has_many :vital_record
         has_many :progress_record

  def full_name
    self.first_name + "　" + self.last_name
  end
end
