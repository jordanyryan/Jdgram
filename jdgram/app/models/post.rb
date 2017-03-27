class Post < ApplicationRecord
  has_many :comments, dependent: :destroy 
  belongs_to :user
  validates :image, presence: true
  validates :user_id, presence: true 
  has_attached_file :image, styles: { :medium => "340x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
