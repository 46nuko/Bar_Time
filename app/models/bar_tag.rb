class BarTag < ApplicationRecord

  belongs_to :bar
  belongs_to :tag

  validates :name, presence: true
  validates :address, presence: true

end
