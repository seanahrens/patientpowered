class PcoriController < ApplicationController
  before_action :define_author

  def define_author
    @author = User.find(1)
  end

end
