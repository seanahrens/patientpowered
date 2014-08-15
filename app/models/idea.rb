class Idea < ActiveRecord::Base
  belongs_to :author, :class => User
  acts_as_followable

end
