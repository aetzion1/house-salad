class SearchController < ApplicationController
    def index
        state = params[:state]
# A more flexible way to use Faraday is to start with a Faraday::Connection object.
# Connection objects can store a common URL base path or HTTP headers to apply to every request. 
#All of the HTTP verb helpers (Faraday.get, Faraday.post, etc) are available on the Faraday::Connection instance.
        # conn = Faraday.new(url: 'https://api.propublica.org/') do |faraday|
        #     faraday.headers["X-API-Key"] = ENV["PROPUBLICA_API_KEY"]
        # end
        conn = Faraday.new(
            url: 'https://api.propublica.org/',
            headers: {"X-API-Key" => ENV["PROPUBLICA_API_KEY"]}
        )
        #can you throw params in here?^

        response = conn.get("/congress/v1/members/house/#{state}/current.json")
        json = JSON.parse(response.body, symbolize_names: true)
        @members = json[:results]

        # binding.pry
    end
end