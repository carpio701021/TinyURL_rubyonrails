class CatchAllController < ApplicationController
  def index
    # Get the requested tiny url and redirect to it (if not works, shows an error)
    url = Tinyurl.find_by(tiny_url: "http://#{request.host}:#{request.port}"+request.fullpath)
    unless url 
      render html: ("<h1>Url: <br/> http://#{request.host}:#{request.port}"+request.fullpath+" <br/>not found.</h1>").html_safe
    else
      redirect_to url.original_url
    end
    
  end
end
