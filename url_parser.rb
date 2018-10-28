# require 'uri'

class UrlParser
  def initialize(url)
    @url = url
  end

  def scheme
    @url.split(':').first
  end

  def domain
    @url.split('/')[2].split(':').first
  end

  def port
    temp_port = @url.split('/')[2].split(':').last
    if temp_port.to_i != 0
      temp_port
    elsif self.scheme == 'http'
      "80"
    else 
      "443"
    end
      
  end

  def path
    temp_path = @url.split('/')[3].split('?').first
    temp_path if temp_path != ""

  end

  def query_string
    @url.split('?').last.split('#').first.split('&').map{|e| e.split('=')}.to_h
  end

  def fragment_id
    @url.split('#').last
  end
end