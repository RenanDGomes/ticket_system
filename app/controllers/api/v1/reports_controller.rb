require 'csv'

module Api
  module V1
    class ReportsController < ApplicationController
      before_action :authenticate_request

      def tickets_count
        start_date = parse_date(params[:start_date])
        end_date = parse_date(params[:end_date])&.end_of_day

        if start_date && end_date
          count = Ticket.where(created_at: start_date..end_date).count
          render json: { tickets_count: count }, status: :ok
        else
          render json: { error: 'Invalid or missing start_date or end_date' }, status: :bad_request
        end
      end

      def export_csv
        tickets = Ticket.all

        csv_data = CSV.generate(headers: true) do |csv|
          csv << %w[ticket_id client_name created_at]
          tickets.each do |ticket|
            csv << [ticket.id, ticket.client_name, ticket.created_at]
          end
        end

        send_data csv_data,
                  filename: "tickets_report_#{Time.now.strftime('%Y%m%d%H%M%S')}.csv",
                  type: 'text/csv'
      end

      private

      def parse_date(date_string)
        DateTime.parse(date_string) rescue nil
      end
    end
  end
end
