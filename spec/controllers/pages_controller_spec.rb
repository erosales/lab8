require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end
  
 describe "GET 'login'" do
    it "returns http success" do
      get 'login'
      response.should be_success
    end
  end

end
