class ReportsController < ApplicationController
    def balance
        PersonMailer.balance_report(user: current_user).deliver_now
        redirect_to root_path, notice: 'Relatório enviado para seu e-mail'
    end
end
