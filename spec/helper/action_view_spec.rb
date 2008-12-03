require File.dirname(__FILE__) + '/../spec_helper'

describe ActionView::Base do

  before :all do
    @view = ActionView::Base.new
  end
  
  it "should translate labels" do
    jokes = nil
    previous_label = "Anterior"
    next_label = "Seguinte"
    should_translate(:previous).and_return(previous_label)
    should_translate(:next).and_return(next_label)
    @view.should_receive(:will_paginate).with(jokes, :previous_label => previous_label, :next_label => next_label)
    @view.paginate(jokes)
  end
  
  def should_translate(key)
    I18n.should_receive(:t).with(key)
  end

end
