class RecordsController < ApplicationController
  def index
    @record = Record.new
    @records = Record.search(params[:search])
  end

  def create
    ImportData.new(params[:file]).import
    flash[:notice] = 'Data uploaded successfully'
    redirect_to records_path
  end

  def download_csv_by_nationality
    send_data Record.customer_count_by_nationality, filename: "nationality.csv"
  end

  def download_csv_by_odometer
    send_data Record.average_odometer_reading_by_nationality, filename: "odometer.csv"
  end
end
