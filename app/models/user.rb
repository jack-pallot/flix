class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
    :registerable,
    :recoverable, 
    :rememberable, 
    :validatable, 
    password_length: 12..128

  Devise.setup do |config|
    # The default HTTP method used to sign out a resource. Default is :delete.
    config.sign_out_via = :get
  end
end
