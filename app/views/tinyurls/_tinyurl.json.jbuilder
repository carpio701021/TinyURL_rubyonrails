json.extract! tinyurl, :id, :original_url, :tiny_url, :expiration, :created_at, :updated_at
json.url tinyurl_url(tinyurl, format: :json)
