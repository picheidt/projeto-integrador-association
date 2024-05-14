require 'csv'

class CsvGenerator

    def self.generate_from_table(database_class, columns, order_by: nil)
        data = self.get_data(database_class, columns, order_by)
        return generate_csv(data, columns)
    end

    private

    def self.get_data(database_class, columns, order_by)
        data = database_class.select(columns)
        return data.order(order_by) if order_by.present?
    end

    def self.generate_csv(data, columns)
        CSV.generate(headers: true, col_sep: ";") do |csv|
            csv << columns
            data.each do |record|
                csv << columns.map { |columns| record[columns] }
            end
        end
    end
end