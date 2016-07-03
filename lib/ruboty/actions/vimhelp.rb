require "faraday"
require 'erb'
require "json"

module Ruboty module Actions
	class VimHelp < Base
		def call
			message.reply search message[:query]
		end

		private
		def search query
			client = Faraday::Connection.new("http://vim-help-jp.herokuapp.com")
			response = client.get "/api/search/json/?query=#{ERB::Util.url_encode query}"
			result = JSON.parse(response.body)["text"]
			result.empty? ? "Not found '#{query}.'" : result
		end
	end
end end
