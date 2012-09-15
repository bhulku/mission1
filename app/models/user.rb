class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:token
  # attr_accessible :title, :body
  has_one :secret_code,:dependent=>:destroy
  attr_accessor :token
  validate :validate_user_token,:on=>:create
 # before_create :validate_user_token
  
  def validate_user_token
    secret_token =SecretCode.where(:token=>self.token).first
    if secret_token.present?

      if secret_token.user.present?
        errors.add(:token, "is already used try another token") 
      else
        self.secret_code = secret_token
      end  
    else
      errors.add(:token, "is not valid")
    end  
  end
end
