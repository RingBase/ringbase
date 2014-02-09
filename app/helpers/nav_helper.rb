module NavHelper
  def current_class(path)
    current_page?(path) ? 'active' : ''
  end
end
