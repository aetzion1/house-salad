class SearchFacade
    def self.members(state)
        conn = Faraday.new(
            url: 'https://api.propublica.org/',
            headers: {"X-API-Key" => ENV["PROPUBLICA_API_KEY"]}
        )
        #can you throw params in here? adapter choices? ^
        # faraday.adapter Faraday.default_adapter

        response = conn.get("/congress/v1/members/house/#{state}/current.json")
        json = JSON.parse(response.body, symbolize_names: true)
        @members = json[:results].map do |member_data|
            Member.new(member_data)
        end 
    end
end