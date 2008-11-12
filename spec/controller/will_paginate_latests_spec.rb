require File.dirname(__FILE__) + '/../spec_helper'

class RailersController < ActionController::Base
  def simple
    @railers = paginate_latests(:railers)
  end
  def per_page
    @railers = paginate_latests(:railers, :per_page => 20)
  end
end

describe RailersController do
  
  before :each do
    @result = 567
    @page = 1
    @per_page = 10
  end
  
  def expect
    Railer.should_receive(:paginate).
          with(:page => @page, :per_page => @per_page, :order => "id DESC").
          and_return(@result)
  end

  it "should paginates latests railers by id" do
    @page = "5"
    expect
    get :simple, { :page => @page }
    assigns[:railers].should eql(@result)
  end
  
  it "should paginate given a per_page" do
    @per_page = 20
    expect
    get :per_page
    assigns[:railers].should eql(@result)
  end

end
