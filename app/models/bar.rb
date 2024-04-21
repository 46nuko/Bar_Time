class Bar < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
end