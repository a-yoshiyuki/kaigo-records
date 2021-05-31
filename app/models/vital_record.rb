class VitalRecord < ApplicationRecord

  belongs_to :staff_member
  belongs_to :customer

  validates :time, presence: true
  validates :body_temperature, presence: true
  validates :heart_rate, presence: true
  validates :oxygen, presence: true
  validates :blood_pressure_high, presence: true
  validates :blood_pressure_low, presence: true

  def self.today_vital
    VitalRecord.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).last
  end

end
