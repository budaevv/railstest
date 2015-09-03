class Book < ActiveRecord::Base
  belongs_to :author
  validates :title, presence: true, length: { minimum: 5 }
  validates :year, numericality: { only_integer: true }
end
