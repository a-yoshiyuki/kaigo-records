class StaffMember::CustomersController < ApplicationController
  before_action :authenticate_staff_member!

  def index
    @customers = Customer.where.not(is_deleted: 3)
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
    @vital_record = @customer.vital_records.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).last
    @meal_record = @customer.meal_records.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).last
  end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :is_deleted)
    end

end
