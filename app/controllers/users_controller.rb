class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [] #add authentication here where needed


  def index
    if params[:condition] && params[:role]
      @users = User.with_role(params[:role]).tagged_with(params[:condition])
    elsif params[:condition]
      @users = User.tagged_with(params[:condition])
    elsif params[:role]
      @users = User.with_role(params[:role])
    else
      @users = User.all
    end

  end


  def by_condition
    @tags = User.tag_counts_on(:tags).order('count desc')
    #alpha?
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    update_role(:patient)
    update_role(:researcher)
    update_role(:stakeholder)

    if @user.update(user_params)
      flash[:notice] = "Your Interests Have Been Set!"
    end

    render "edit"
  end

  private

  def update_role(role)
    if params[role] == "1"
      @user.grant(role)
    elsif params[role] == "0"
      @user.remove_role(role)
    end
  end

  def user_params
    params.require(:user).permit(:tag_list, :full_name, :role)
  end
end