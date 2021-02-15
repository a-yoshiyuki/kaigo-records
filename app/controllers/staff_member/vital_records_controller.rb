class StaffMember::VitalRecordsController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @vital_records = @customer.vital_records.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).order(id: "DESC")
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
    @vital_record = VitalRecord.find(params[:id])
  end

  def update
    @vital_record = VitalRecord.find(params[:id])
    @vital_record.update(vital_record_params)
    redirect_to staff_member_vital_record_path(@vital_record.customer)
  end

  def index
    @vital_records = VitalRecord.page(params[:page]).reverse_order
  end

  def destroy
    @vital_record = VitalRecord.find(params[:id])
    @vital_record.destroy
    redirect_to staff_member_vital_record_path(@vital_record.customer)
  end

  private
    def vital_record_params
      params.require(:vital_record).permit(:customer_id, :staff_members_id, :time, :body_temperature, :heart_rate, :oxygen, :blood_pressure_high, :blood_pressure_low)
    end

end
