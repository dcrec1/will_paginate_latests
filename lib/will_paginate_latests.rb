ActionController::Base.class_eval do
  def paginate_latests(sym, map = {})
    model = sym.to_s.gsub("_", " ").singularize.split.each{ |word| word.capitalize! }.join('')
    page = params[:page] || 1
    map.merge!(:page => page, :order => "id DESC") 
    Kernel.const_get(model).paginate(map)
  end
end
