class PcoriController < ApplicationController
  before_action :define_author

  def define_author
    @author = User.first
    raise "We need a user on the site for this to work!" if !@author
  end

end
