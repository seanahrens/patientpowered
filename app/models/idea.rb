class Idea < ActiveRecord::Base
  belongs_to :author, :class => User

end
