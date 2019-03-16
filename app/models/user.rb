require "image_processing/mini_magick"

class ProfilePicUploader < Shrine
  plugin :processing # allows hooking into promoting
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading

  process(:store) do |io, context|
    versions = { }

    io.download do |original|
      pipeline = ImageProcessing::MiniMagick.source(original)

      versions[:large]  = pipeline.resize_to_limit!(800, 800)
      versions[:medium] = pipeline.resize_to_limit!(500, 500)
      versions[:small]  = pipeline.resize_to_limit!(300, 300)
    end

    versions # return the hash of processed files
  end
end

class User < ApplicationRecord
  include ProfilePicUploader::Attachment.new(:profile_pic) # adds an `profile_pic` virtual attribute

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, format: { with: /\A[A-Z0-9]+\z/i, message: "Please only use the following characters in your username: A-Z, a-z, 0-9" }, :length => { :minimum => 1, :maximum => 64 }
  
  attr_readonly :username
  attr_writer :login

  def login
    #@login || self.username || 
    self.email
  end
end
