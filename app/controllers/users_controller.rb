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


  def following_idea
    if params[:idea].present?
      @idea = Idea.find(params[:idea])
      @users = @idea.following_users
    else
      @users = User.all
    end
    render "index"
  end


  def by_condition
    #@tags = ActsAsTaggableOn::Tag.all
    #@tags = ActsAsTaggableOn::Tag.includes(:taggings).select("DISTINCT tags.*")
    @tags = User.tag_counts_on(:tags).order('count desc')
    #alpha?
  end

  def edit
    @user = current_user
    # set up new users with default tag list
    if @user.tag_list.empty?
      @user.tag_list = User.tag_counts_on(:tags).order('count desc').limit(3).collect { |t| t }
    end
  end

  def update
    @user = current_user


    update_role(:patient)
    update_role(:researcher)
    update_role(:stakeholder)

    if @user.update(user_params)
      flash[:notice] = "Your Interests Have Been Set!"
    end

    redirect_to me_path(current_user)
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
    params.require(:user).permit(:tag_list, :full_name, :role, :location, :affiliation)
  end
end