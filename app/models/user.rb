class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :password, :password_confirm
  
  email_regexp = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
  validates :email, :presence => true,
                    :format => { :with => email_regexp},
                    :uniqueness => {:case_sensitive => false}
                    
  validates :password, :presence => true,
                   :confirmation => true,
                   :length => { :within => 6..40 }
  before_save :encrypt_password
  
  private
    def encrypt_password
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      string #temp implemetation!
    end                       
end