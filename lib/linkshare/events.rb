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
      [:process_date_start, :process_date_end, :transaction_date_start, :transaction_date_end].each do |param|
        next unless params.has_key?(param)

        params[param] = [DateTime.parse(params[param]).strftime("%F %T")].join
      end
      param_str = params.map{|x| "#{x[0]}=#{x[1]}"}.join('&')
      url = [base_url, '?', param_str].join
      Linkshare::Response.json_parse(Linkshare::Request.get(url, {:headers => {'Accept' => 'text/json'}}))
    end
  end
end
