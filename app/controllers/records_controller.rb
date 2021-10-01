class RecordsController < ApplicationController
  def new
    @records = Record.new
  end

  def create
    ImportData.new(params[:file]).import
    flash[:notice] = 'Data uploaded successfully'
    redirect_to records_path
  end
end
