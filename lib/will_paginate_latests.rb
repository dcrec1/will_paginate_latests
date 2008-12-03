ActionController::Base.class_eval do
  def paginate_latests(sym, map = {})
    model = sym.to_s.gsub("_", " ").singularize.split.each{ |word| word.capitalize! }.join('')
    page = params[:page] || 1
    map.merge!(:page => page, :order => "id DESC") 
    Kernel.const_get(model).paginate(map)
  end
end

ActionView::Base.class_eval do
  def paginate(collection)
    will_paginate(collection, :previous_label => I18n.t(:previous), :next_label => I18n.t(:next))
  end
end
