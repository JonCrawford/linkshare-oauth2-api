module Linkshare
  class Events

    # 
    # Description of #getEvents
    #
    # @param params [Hash] default: {}
    # @return [Array] Array of hashes containing Event data.
  	def getEvents(params = {})
      base_url = Linkshare::API_URIS[:events]
      params.reverse_merge!(limit: 1000, page: 1)
      url = "#{base_url}?#{params.to_query}"
  		Linkshare::Response.json_parse(Linkshare::Request.get(url, {:headers => {'Accept' => 'text/json'}}))
  	end
  end
end
