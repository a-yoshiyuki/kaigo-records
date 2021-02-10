class StaffMember::VitalRecordsController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @vital_record = VitalRecord.find(params[:id])
  end

  def new
    @customer = Customer.find(params[:id])
    @vital_record = VitalRecord.new
  end

  def create
    @vital_record = VitalRecord.new
    @customer.save
    redirect_to staff_member_vital_record_path(@customer)
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
