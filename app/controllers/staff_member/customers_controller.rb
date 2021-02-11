class StaffMember::CustomersController < ApplicationController

  def index
    @customers = Customer.where.not(is_deleted: 3)
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
    @vital_record = VitalRecord.last
  end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :is_deleted)
    end

end
