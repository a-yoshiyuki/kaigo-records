class StaffMember::MealRecordsController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @meal_records = MealRecord.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).last
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @meal_record = MealRecord.new
  end

  def create
    @meal_record = MealRecord.new(meal_record_params)
    @meal_record.staff_member = current_staff_member
    @meal_record.customer = Customer.find(params[:customer_id])
    @meal_record.save
    redirect_to staff_member_meal_record_path(@meal_record.customer)
  end

  def edit
    @meal_records = MealRecord.find(params[:id])
  end

  def update
    @meal_record = MealRecord.find(params[:id])
    @meal_record.update(meal_record_params)
    redirect_to staff_member_meal_record_path(@meal_record.customer)
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @meal_records = MealRecord.where(customer_id: @customer.id).page(params[:page]).reverse_order
  end

  def destroy
  end

  private
    def meal_record_params
      params.require(:meal_record).permit(:customer_id, :staff_members_id, :breakfast_main_amount, :breakfast_side_amount, :lunch_main_amount, :lunch_side_amount, :dinner_main_amount, :dinner_side_amount, :water_amount)
    end

end
