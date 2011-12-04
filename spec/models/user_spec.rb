require 'spec_helper'

describe User do
  before (:each) do
    @attr = {:email => "jdoe@example.com",
             :password => "myPassword",
             :password_confirm => "myPassword"
    }
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject email addresses that are invalid" do
    invalid_addresses = %w[user@foo,com user_at_foo.org example@foo. @foo.com]
    invalid_addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should accept email addresses that are valid" do
    valid_addresses = %w[user@foo.com user@foo.blech.org example.user@foo.com]
    valid_addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    user1 = User.create!(@attr)
    user1.should be_valid
    user2 = User.new(@attr)
    upperCaseEmail = @attr[:email].upcase
    user3 = User.new(@attr.merge(:email => upperCaseEmail))
  end
  
  
describe "password validations" do
  
  it "should require a password" do
    no_password_user = User.new(@attr.merge(:password => ""))
    no_password_user.should_not be_valid
  end
  
  it "should require a password" do
    User.new(@attr.merge(:password => "", :password_confirm => "")).should_not be_valid
  end
  
  it "should require a matching password confirmation" do
    User.new(@attr.merge(:password_confirm => "invalid")).should_not be_valid
  end
  
  it("should reject short passwords") do
    short = "a" * 5
    hash = @attr.merge(:password => short, :password_confirm => short)
    User.new(hash).should_not be_valid
  end
  
  it("should reject long passwords") do
    long = "a" * 41
    hash = @attr.merge(:password => short, :password_confirm => short)
    User.new(hash).should_not be_valid
  end     
end

describe "password encryption" do
  
  before(:each) do
    @user = User.create!(@attr)
  end
  
  it "should have an encrypted password attribute" do
    @user.should respond_to(:encrypted_password)
  end
  
  it "should set the encrypted password" do
    @user.encrypted_password.should_not be_blank
  end
end

end 