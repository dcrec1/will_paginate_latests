ActionController::Base.class_eval do
  def paginate_latests(sym, *map)
    model = sym.to_s.gsub("_", " ").singularize.split.each{ |word| word.capitalize! }.join('')
    page = params[:page] || 1
    per_page = (map.first[:per_page] if map.size > 0) || 10
    Kernel.const_get(model).paginate(:page => page, :order => "id DESC", :per_page => per_page)
  end
end