class Image < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  has_many :comments
  belongs_to :user
end
