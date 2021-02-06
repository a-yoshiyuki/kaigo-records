class Customer < ApplicationRecord

  has_many :progress_record
  has_many :vital_record

  def full_name
    self.first_name + "　" + self.last_name
  end


end
