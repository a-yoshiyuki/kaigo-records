class StaffMember::CustomersController < ApplicationController
  before_action :authenticate_staff_member!

  def index
    @customers = Customer.where.not(is_deleted: 3)
  end

  def show
    @customer = Customer.find(params[:id])
    @vital_records = @customer.vital_records.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).order(id: "DESC")
    @meal_record = @customer.meal_records.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).last
    @progress_records = @customer.progress_records.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).order(id: "DESC")
  end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :is_deleted)
    end

end
