class Supercar < ActiveRecord::Base
require 'oembed'

	is_impressionable :counter_cache => true, :column_name => :session_count, :unique => :session_hash
	# is_impressionable :counter_cache => true, :column_name => :unique_ip_count, :unique => true

	belongs_to :make
	belongs_to :car_model
	belongs_to :city
	belongs_to :country
	belongs_to :spot_type
	
	belongs_to :user

	before_validation :https_to_http_protocol

	before_validation :save_oembed_json_to_record
	validates_presence_of :supercar_url, :on => :create	
	# validates_format_of :supercar_url, :with => /instagram\.com\/p\/*/

	# e.g validates_format_of :video_link, :with => /youtu\.be\/([^\?]*)/ || /^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/



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
