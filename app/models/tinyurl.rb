class Tinyurl < ApplicationRecord
    validates :tiny_url, uniqueness: true
end
