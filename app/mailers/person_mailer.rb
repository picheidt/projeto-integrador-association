class PersonMailer < ApplicationMailer
    default from: 'teste@example.com'

    def balance_report(user: current_user)
        csv_data = CsvGenerator.generate_from_table(Person, ['name', 'balance'], order_by: 'name')

        attachments['balance_reports.csv'] = csv_data
        mail(to:user.email , subject: 'relatório')
    end
end
