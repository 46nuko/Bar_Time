class Bar < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :bar_tags, dependent: :destroy
  has_many :tags, through: :bar_tags

  def self.looks(search, word)
    if search == "partial_match"
      @bar = Bar.where("name LIKE ?", "%#{word}%")
    else
      @bar = Bar.all
    end
  end
end