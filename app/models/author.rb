class Author < ActiveRecord::Base
  has_many :books , dependent: :destroy
  validates :fio, presence: true,
            length: { minimum: 5 }
end
