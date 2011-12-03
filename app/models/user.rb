class User < ActiveRecord::Base
  attr_accessible :email, :password
  
  email_regexp = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
  validates :email, :presence => true,
                    :format => { :with => email_regexp},
                    :uniqueness => {:case_sensitive => false}
                    
  validates :password, :presence => true,
                   :length => { :maximum => 50}
end