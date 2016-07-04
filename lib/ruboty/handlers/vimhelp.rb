require_relative "../actions/vimhelp.rb"


module Ruboty module Handlers
	class VimHelp < Base
		on(
			/:(h|help) (?<query>.+)/,
			name: "help",
			description: "Show ':help {query}' from vim.",
		)
		def help message
			Ruboty::Actions::VimHelp.new(message).call
		end
	end
end end
