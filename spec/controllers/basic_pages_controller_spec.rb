require 'spec_helper'

describe BasicPagesController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'about_me'" do
    it "should be successful" do
      get 'about_me'
      response.should be_success
    end
  end

end
