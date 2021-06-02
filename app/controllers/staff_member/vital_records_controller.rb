class StaffMember::VitalRecordsController < ApplicationController
  before_action :authenticate_any!

  def show
    @customer = Customer.find(params[:id])
    @vital_records = @customer.vital_records.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).order(id: "DESC")
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @vital_record = VitalRecord.new
  end

  def create
    @vital_record = VitalRecord.new(vital_record_params)
    @vital_record.staff_member = current_staff_member
    @vital_record.customer = Customer.find(params[:customer_id])
    if @vital_record.save
      redirect_to list_staff_member_vital_records_path
    else
      render :new
    end
  end

  def edit
    @vital_record = VitalRecord.find(params[:id])
  end

  def update
    @vital_record = VitalRecord.find(params[:id])
    if @vital_record.update(vital_record_params)
      redirect_to list_staff_member_vital_records_path
    else
      render :edit
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @vital_records = VitalRecord.where(customer_id: @customer.id).page(params[:page]).reverse_order
  end

  def list
    @customers = Customer.where.not(is_deleted: 3)
  end

  def destroy
  end

  private
    def vital_record_params
      params.require(:vital_record).permit(:customer_id, :staff_members_id, :time, :body_temperature, :heart_rate, :oxygen, :blood_pressure_high, :blood_pressure_low)
    end

end
