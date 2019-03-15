class CatchAllController < ApplicationController
  def index
    # Get the requested tiny url and redirect to it (if not works, shows an error)
    url = Tinyurl.find_by(tiny_url: request.fullpath.remove("/"))
    unless url 
      render html: ("<h1>Url: <br/> http://#{request.host}:#{request.port}"+request.fullpath+" <br/>not found.</h1>").html_safe
    else
      unless url.expiration > DateTime.now
        render html: ("<h1>Url: <br/> http://#{request.host}:#{request.port}"+request.fullpath+" <br/>expired.</h1>").html_safe
      else
        url.increment(:used_count)
        url.save
        redirect_to url.original_url
      end
    end
    
  end
end
