require File.dirname(__FILE__) + '/../spec_helper'

class RailersController < ActionController::Base
  def index
    @railers = paginate_latests(:railers)
  end
end

describe RailersController do

  it "should paginates latests railers by id" do
    result = 567
    page = "5"
    Railer.should_receive(:paginate).with(:page => page, :order => "id DESC").and_return(result)
    get :index, { :page => page, }
    assigns[:railers].should eql(result)
  end

end
