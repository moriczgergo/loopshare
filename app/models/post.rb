class Post < ApplicationRecord
  validates :content, presence: true, :length => { :minimum => 1, :maximum => 300 }
end
