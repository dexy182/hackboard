class Post < ActiveRecord::Base
  attr_accessible :description, :link

  validates :description, presence: true
  validates :link, presence: true,
  					format: /http:\/\/./

  has_many :comments
  belongs_to :user
end
