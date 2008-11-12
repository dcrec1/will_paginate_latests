ActionController::Base.class_eval do
  def paginate_latests(sym)
    model = sym.to_s.gsub("_", " ").singularize.split.each{ |word| word.capitalize! }.join('')
    page = params[:page] || 1
    Kernel.const_get(model).paginate(:page => page, :order => "id DESC")
  end
end