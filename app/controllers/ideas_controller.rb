class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :follow, :stop_following]
  before_action :auth_user_to_join, :only => [:follow, :stop_following, :new]


  def auth_user_to_join
    redirect_to new_user_registration_url unless user_signed_in?
  end


  def tagged
    if params[:tag].present?
      @ideas = Idea.tagged_with(params[:tag])
      @condition = params[:tag]
    else
      @ideas = Idea.all
    end
    render "index"
  end

  def add_new_comment
    @idea = Idea.find(params[:id])
    @comment = Comment.new(params[:comment].permit(:comment))
    @comment.user = current_user
    @idea.comments << @comment
    redirect_to :action => :show, :id => @idea
  end


  def follow
    current_user.follow(@idea)
    redirect_to :back
  end

  def stop_following
    current_user.stop_following(@idea)
    redirect_to :back
  end


  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    @idea.tag_list = current_user.tag_list
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @idea.author = current_user
    respond_to do |format|
      if @idea.save
        current_user.follow(@idea)

        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:author_id, :title, :description, :video_url, :tag_list)
    end


end
