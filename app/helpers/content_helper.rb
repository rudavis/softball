module ContentHelper
  def resource_name
    :player
  end

  def resource
    @resource ||= Player.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:player]
  end
  def to_ba(s)
  	s.match(/\.\d\d\d/).to_s
  end
end