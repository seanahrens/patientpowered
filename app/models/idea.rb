class Idea < ActiveRecord::Base
  belongs_to :author, :class => User
  acts_as_followable
  acts_as_commentable
  acts_as_taggable

  def followers_count_by_role(role)
    followers.count { |x| x.has_role?(role)}

  end

end
