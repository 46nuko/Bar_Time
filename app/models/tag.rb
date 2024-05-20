class Tag < ApplicationRecord

  belongs_to :bar

  def self.looks(search, word)
    if search == "partial_match"
      @tag = Tag.where("name LIKE ?", "%#{word}%")
    else
      @tag = Tag.all
    end
  end
end
