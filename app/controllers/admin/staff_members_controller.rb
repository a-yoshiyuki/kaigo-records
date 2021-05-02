class Admin::StaffMembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @staff_members = StaffMember.page(params[:page]).reverse_order
  end

  def show
    @staff_member = StaffMember.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit
    @staff_member = StaffMember.find(params[:id])
  end

  def update
    @staff_member = StaffMember.find(params[:id])
    @staff_member.update(staff_member_params)
    redirect_to admin_staff_member_path(@staff_member)
  end

  def destroy
    @staff_member = StaffMember.find(params[:id])
    if @staff_member.destroy
      redirect_to admin_staff_members_path
    else
      render :index

    end
  end

  private
    def staff_member_params
      params.require(:staff_member).permit(:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
    end
end
