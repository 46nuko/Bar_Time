class Tag < ApplicationRecord

  has_many :bar_tags, dependent: :destroy
  has_many :bars, through: :bar_tags

  validates :name, presence: true, uniqueness: true

  def self.looks(search, word)
    if search == "partial_match"
      @tag = Tag.where("name LIKE ?", "%#{word}%")
    else
      @tag = Tag.all
    end
  end
end
