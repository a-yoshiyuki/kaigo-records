class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).reverse_order
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit

  end

  def update

  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to admin_customers_path(@customer)
  end

  def list

  end

  def exit

  end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,)
    end
end
