class StaffMember::ProgressRecordsController < ApplicationController
  before_action :authenticate_any!

  def show
    @customer = Customer.find(params[:id])
    @progress_records = @customer.progress_records.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).order(id: "DESC")
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @progress_record = ProgressRecord.new
  end

  def create
    @progress_record = ProgressRecord.new(progress_record_params)
    @progress_record.customer = Customer.find(params[:customer_id])
    if @progress_record.save
      @customer = Customer.find(params[:customer_id])
      redirect_to staff_member_progress_record_path(@customer.id)
    else
      render :new
    end
  end

  def edit
    @progress_record = ProgressRecord.find(params[:id])
  end

  def update
    @progress_record = ProgressRecord.find(params[:id])
    if @progress_record.update(progress_record_params)
      redirect_to staff_member_progress_record_path(@progress_record.customer)
    else
      render :edit
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @progress_records = ProgressRecord.where(customer_id: @customer.id).page(params[:page]).reverse_order
  end

  def destroy
    @progress_record = ProgressRecord.find(params[:id])
    @progress_record.destroy
    redirect_to staff_member_progress_record_path(@progress_record.customer)
  end

  def list
    @customers = Customer.where.not(is_deleted: 3)
  end

  private
    def progress_record_params
      params.require(:progress_record).permit(:customer_id, :staff_member_id, :time, :detail)
    end
end
