class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, presence: true
  validates :email, presence: true
  
  has_many :posts
  has_many :comments
  
end
