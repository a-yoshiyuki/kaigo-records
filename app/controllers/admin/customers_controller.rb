class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.where.not(is_deleted: 3)
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to admin_customers_path(@customer)
    else
      render :new
    end
  end

  def list
    @customers = Customer.where(is_deleted: 3).page(params[:page]).reverse_order
    @customer = Customer.new
  end

  def exit
  end

  def search
    @customers = Customer.search(params[:search]).page(params[:page]).reverse_order
  end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :is_deleted)
    end
end
