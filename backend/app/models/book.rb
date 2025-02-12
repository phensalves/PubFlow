class Book < ApplicationRecord
  has_many :sales
  has_many :recommendations
  belongs_to :author
end
