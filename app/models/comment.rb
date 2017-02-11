class Comment < ActiveRecord::Base
  validates :author, :content, presence: true
  belongs_to :job
end
