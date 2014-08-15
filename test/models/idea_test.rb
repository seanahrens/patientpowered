require "test_helper"

class IdeaTest < ActiveSupport::TestCase

  def idea
    @idea ||= Idea.new
  end

  def test_valid
    assert idea.valid?
  end

end
