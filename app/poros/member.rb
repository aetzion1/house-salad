# Creating a Plain Old Ruby Object (PORO), rather than a Model, since we don’t intend to store this data in our database
class Member
    attr_reader :name,
                :role,
                :party,
                :district

    def initialize(attributes)
        @name = attributes[:name]
        @role = attributes[:role]
        @party = attributes[:party]
        @district = attributes[:district]
    end
end