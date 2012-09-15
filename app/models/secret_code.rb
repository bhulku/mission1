class SecretCode < ActiveRecord::Base
  attr_accessible :token, :user_id
  belongs_to :user
  validates_uniqueness_of :token

  def self.generate_token(number_of_token=1)
    
    (0...number_of_token.to_i).to_a.each do |i|
      self.create_code
    end

  end

  def self.create_code
    secret_token = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).sample(8).join 
    secret_code = SecretCode.new(:token=>secret_token)
    if secret_code.valid?
      secret_code.save
    else
      create_code
    end  
  end
end
