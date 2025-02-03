class Book < ApplicationRecord
  has_many :sales
  has_many :recommendations
end
