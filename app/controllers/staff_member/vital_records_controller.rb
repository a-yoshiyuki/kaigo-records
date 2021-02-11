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
    @vital_record.staff_member = current_staff_member
    @vital_record.save

    @customer = Customer.find(vital_record_params[:customer_id])
    redirect_to staff_member_vital_record_path(@customer.id)  #vital_record_params[:customer_id])
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
      params.require(:vital_record).permit(:customer_id, :staff_members_id, :time, :body_temperature, :heart_rate, :oxygen, :blood_pressure_high, :blood_pressure_low)
    end

end
