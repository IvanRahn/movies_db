class Movie < ApplicationRecord
  validates :title, presence: true
  validates :runtime, presence: true
  
end
