class Potd < ActiveRecord::Base
  
require 'oembed'
  before_validation :https_to_http_protocol
  before_validation :save_oembed_json_to_record
  validates_presence_of :supercar_url, :on => :create

protected

def save_oembed_json_to_record
resource = OEmbed::Providers::Instagram.get("#{supercar_url}")
self.html = resource.html
self.author_name = resource.author_name
self.thumbnail_url = resource.thumbnail_url
self.title = resource.title
end

def https_to_http_protocol
  if supercar_url[/\Ahttps:\/\//]
    self.supercar_url = supercar_url.gsub(/\Ahttps:/, "http:")
  end
end

end
