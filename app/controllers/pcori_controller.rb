class PcoriController < ApplicationController
  before_action :define_author
  before_action :catch_flash_message
  before_action :set_body_class_to_idea, :only => [:idea_index,:idea_show,:idea_new]
  before_action :set_body_class_to_study, :only => [:study_index,:study_show,:study_new]

  def set_body_class_to_idea
    @body_class = "idea"
  end

  def set_body_class_to_study
    @body_class = "study"
  end

  def define_author
    @author = User.first
    raise "We need a user on the site for this to work!" if !@author
  end

  def catch_flash_message
    flash[:notice] = params[:notice] if params[:notice]
  end

  def overview


  end

  def stats

  end


  def slides
    # if !upload_complete
    #   render :text => "Slides are currently uploading... Refresh in a few minutes"
    # else
    #   render :upload
    # end
  end

end
