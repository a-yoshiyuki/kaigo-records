class StaffMember::MealRecordsController < ApplicationController
  before_action :authenticate_any!

  def show
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @meal_record = MealRecord.new
  end

  def create
    @meal_record = MealRecord.new(meal_record_params)
    @meal_record.staff_member = current_staff_member
    @meal_record.customer = Customer.find(params[:customer_id])
    if @meal_record.save
      redirect_to list_staff_member_meal_records_path
    else
      @customer = Customer.find(params[:customer_id])
      render :new
    end
  end

  def edit
    @meal_records = MealRecord.find(params[:id])
  end

  def update
    @meal_record = MealRecord.find(params[:id])
    if @meal_record.update(meal_record_params)
      redirect_to list_staff_member_meal_records_path
    else
      @meal_records = MealRecord.find(params[:id])
      render :edit
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @meal_records = MealRecord.where(customer_id: @customer.id).page(params[:page]).reverse_order
  end

  def list
    @customers = Customer.where.not(is_deleted: 3)
  end

  def destroy
  end

  private
    def meal_record_params
      params.require(:meal_record).permit(:customer_id, :staff_members_id, :breakfast_main_amount, :breakfast_side_amount, :lunch_main_amount, :lunch_side_amount, :dinner_main_amount, :dinner_side_amount, :water_amount)
    end

end
