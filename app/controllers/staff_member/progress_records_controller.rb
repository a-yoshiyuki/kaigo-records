class StaffMember::ProgressRecordsController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def new
  end

  def edit
  end

  def index
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def progress_record_params
      params.require(:progress_record).(:customer_id, :staff_member_id, :time, :detail)
    end
end
