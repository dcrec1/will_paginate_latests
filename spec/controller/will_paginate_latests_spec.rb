require File.dirname(__FILE__) + '/../spec_helper'

class RailersController < ActionController::Base
  def simple
    @railers = paginate_latests(:railers)
  end
  def per_page
    @railers = paginate_latests(:railers, :per_page => @@per_page)
  end
  def condition
    @railers = paginate_latests(:railers, :condition => @@condition)
  end
end

describe RailersController do
  
  before :all do
    @result = 567
    @page = 1
  end
  
  def expect(map = {})
    map.merge!(:page => @page, :order => "id DESC")
    Railer.should_receive(:paginate).with(map).and_return(@result)
  end

  it "should paginates latests railers by id" do
    @page = "5"
    expect
    get :simple, { :page => @page }
    assigns[:railers].should eql(@result)
  end
  
  it "should paginate given a per_page" do
    @@per_page = 20
    expect(:per_page => @@per_page)
    get :per_page
    assigns[:railers].should eql(@result)
  end

  it "should paginate given a condition" do
    @@condition = "1 = 2"
    expect(:condition => @@condition)
    get :condition
    assigns[:railers].should eql(@result)
  end
end
