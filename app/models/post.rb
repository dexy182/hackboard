class Post < ActiveRecord::Base
  attr_accessible :description, :link, :image

  validates :description, presence: true
  validates :link, presence: true,
  					format: /http:\/\/./

  validates_attachment :image, :presence => true, :size => { :in => 0..1.megabytes }

  has_many :comments
  belongs_to :user

  has_attached_file :image,
  	styles:{
  		thumb: '100x100#',
  		medium: '150x150>',
  		large: '200x200>'
  	}

end
