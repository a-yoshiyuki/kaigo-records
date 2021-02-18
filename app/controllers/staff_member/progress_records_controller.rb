class StaffMember::ProgressRecordsController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @progress_records = @customer.progress_records.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).order(id: "DESC")
  end

  def new
    @progress_record = ProgressRecord.new
  end

  def create
    @progress_record = ProgressRecord.new(progress_record_params)
    @progress_record.save
    @customer = Customer.find(progress_record_params[:customer_id])
    redirect_to staff_member_progress_record_path(@customer.id)
  end


  def edit
  end

  def index
  end

  def update
  end

  def destroy
  end

  private
    def progress_record_params
      params.require(:progress_record).permit(:customer_id, :staff_member_id, :time, :detail)
    end
end
