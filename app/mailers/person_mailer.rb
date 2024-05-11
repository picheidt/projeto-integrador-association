class PersonMailer < ApplicationMailer
    default from: 'teste@example.com'

    def balance_report(user: current_user)
        mail(to:user.email , subject: 'relatório')
    end
end
