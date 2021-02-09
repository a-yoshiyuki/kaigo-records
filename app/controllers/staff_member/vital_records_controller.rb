class StaffMember::VitalRecordsController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    #@vital_records = VitalRecord.find(params[:id])
  end

  def new
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
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana)
    end

end
