class VitalRecord < ApplicationRecord

  belongs_to :staff_member
  belongs_to :customer

end
