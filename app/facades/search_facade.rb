class SearchFacade
    def self.members(state)
        json = GovDataService.members_of_house(state)

        @members = json[:results].map do |member_data|
            Member.new(member_data)
        end 
    end
end