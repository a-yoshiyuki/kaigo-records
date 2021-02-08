class StaffMember::CustomersController < ApplicationController

  def index
    @customers = Customer.where.not(is_deleted: 3)
    @customer = Customer.new
  end

  def show
  end

end
