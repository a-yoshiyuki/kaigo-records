class StaffMember::MealRecordsController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @meal_records = @customer.meal_records.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).order(id: "DESC")
  end

  def edit
    @customer = Customer.find(params[:customer_id])

  end

  def update
  end

  def index
  end

  private
    def meal_record_params
      params.require(:meal_record).permit(:customer_id, :staff_members_id, :breakfast_main_amount, :breakfast_side_amount, :lunch_main_amount, :lunch_side_amount, :dinner_main_amount, :dinner_side_amount, :water_amount)
    end

end
