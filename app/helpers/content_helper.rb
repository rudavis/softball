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

  def to_ba(ave)
    ave < "1" ? ave.to_s[1..-1] : ave.to_s[0..3]
  end
end