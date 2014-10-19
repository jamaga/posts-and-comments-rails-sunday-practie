class Post < ActiveRecord::Base
	has_many :comments
end

#  Post.first.comments
