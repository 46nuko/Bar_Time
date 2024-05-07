class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bar

  def self.looks(search, word)
    if search == "partial_match"
      @comment = Comment.where("content LIKE?","%#{word}%")
    else
      @comment = Comment.all
    end
  end
end
