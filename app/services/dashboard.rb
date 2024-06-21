class Dashboard

    def construct_dashboard(user: current_user)
        dash = {
            'active_people_pie_chart' => count_active_people(),
            'total_debts' => active_people_total_debts(),
            'total_payments' => active_people_total_payments(),
            'last_debts' => last_debts(),
            'last_payments' => last_payments(),
            'my_people' => my_people(user: user),
            'last_debt_bigger_than_100000' => debts_bigger_than_100000()
        }

        top_bottom = top_bottom_balance_people()
        dash['balance'] = dash['total_payments'] - dash['total_debts']
        dash['top_person'] = top_bottom[0]
        dash['bottom_person'] = top_bottom[1]

        return dash
    end

    private 

    def count_active_people
        Rails.cache.fetch("active_people", expires_in: 10.minutes) do 
            count_per_group = Person.group(:active).count
            { active: count_per_group[true].to_i, inactive: count_per_group[false].to_i }
        end
    end

    def active_people_total_payments
        Rails.cache.fetch("active_people_payment", expires_in: 10.minutes) do
            Payment.joins(:person).where(people: { active: true }).sum(:amount)
        end
    end

    def active_people_total_debts
        Rails.cache.fetch("active_people_debt", expires_in: 10.minutes) do
            Debt.joins(:person).where(people: { active: true }).sum(:amount)
        end 
    end

    def last_debts
        Rails.cache.fetch("last_debts", expires_in: 10.minutes) do
            Debt.order(created_at: :desc).limit(10).pluck(:id, :amount)
        end
    end

    def last_payments
        Rails.cache.fetch("last_payment", expires_in: 10.minutes) do
            Payment.order(created_at: :desc).limit(10).pluck(:id, :amount)
        end
    end

    def my_people(user: current_user)
        Rails.cache.fetch("#{user.id}/my_people", expires_in: 10.minutes) do
            Person.where(user: user).order(created_at: :desc).limit(10)
        end
    end

    def top_bottom_balance_people
        Rails.cache.fetch("top_bottom_balance", expires_in: 10.minutes) do
            people = Person.all.order(balance: :desc)
            [people.first, people.last]
        end
    end

    def debts_bigger_than_100000
        Debt.includes(:person).where('amount > ?', 100000).order(updated_at: :desc).limit(10)
    end
end