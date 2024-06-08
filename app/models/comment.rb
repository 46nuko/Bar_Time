class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bar

  validates :title, presence: true
  validates :content, presence: true
  validates :bar_id, presence: true
  validates :tag_id, presence: true

  def self.looks(search, word)
    if search == "partial_match"
      @comment = Comment.where("content LIKE?","%#{word}%")
    else
      @comment = Comment.all
    end
  end
end
