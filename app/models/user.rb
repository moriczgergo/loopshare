class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :length => { :minimum => 1, :maximum => 64 }
  
  attr_readonly :username
  attr_writer :login

  def login
    #@login || self.username || 
    self.email
  end
end
