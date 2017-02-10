class Category < ActiveRecord::Base
  has_many :jobs

  validates :title, presence: true
  validates :title, uniqueness: true
end
