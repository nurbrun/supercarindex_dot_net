module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | SupercarindexDotNet"
    end
  end
end
