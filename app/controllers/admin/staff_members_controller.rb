class Admin::StaffMembersController < ApplicationController

  def index
    @staff_members = StaffMember.all
  end

  def show
    @staff_member = StaffMember.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy
    @staff_member = StaffMember.find(params[:id])
    @staff_member.destroy
  end

  private
    def staff_member_params
      params.require(:staff_member).permit(:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
    end
end
