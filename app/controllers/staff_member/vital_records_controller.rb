class StaffMember::VitalRecordsController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @vital_records = VitalRecord.all.order(id: "DESC")
  end

  def new
    @vital_record = VitalRecord.new
  end

  def create
    @vital_record = VitalRecord.new(vital_record_params)
    @vital_record.save
    redirect_to staff_member_vital_record_path(@vital_record)
  end

  def edit

  end

  def update
  end

  def index

  end

  def destroy

  end

  private
    def vital_record_params
      params.require(:vital_record).permit(:customer_id, :time, :body_temperature, :heart_rate, :oxygen, :blood_pressure_high, :blood_pressure_low)
    end

end
