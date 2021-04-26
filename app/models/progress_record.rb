class ProgressRecord < ApplicationRecord

  belongs_to :customer
  belongs_to :staff_member

  validates :time, presence: true
  validates :detail, presence: true

end
