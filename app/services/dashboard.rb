class Dashboard
    def initialize(user: current_user)
        @user = user
    end


    

    def count_active_people
        count_per_group = Person.group(:active).count
        return { active: count_per_group[true].to_i, inactive: count_per_group[false].to_i }
    end
end