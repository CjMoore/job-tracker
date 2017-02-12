class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :category_id, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments


  def self.sort(sort_by)
    if sort_by.include?("location")
      order(:city)
    elsif sort_by.include?("interest")
      order(:level_of_interest)
    end
  end
end
