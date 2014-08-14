class PcoriController < ApplicationController
  before_action :define_author
  before_action :catch_flash_message

  def define_author
    @author = User.first
    raise "We need a user on the site for this to work!" if !@author
  end

  def catch_flash_message
    flash[:notice] = params[:notice] if params[:notice]
  end


end
