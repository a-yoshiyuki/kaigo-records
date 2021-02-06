class Admin::CustomersController < ApplicationController

  def index

  end

  def show

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

end
