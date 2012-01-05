module ApplicationHelper
  def to_ba
    self.to_s.gsub(/^0+/, '')
  end
end
