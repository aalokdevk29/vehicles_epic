class RecordsController < ApplicationController
  def index
    @records = Record.search(params[:search])
  end

  def new
    @record = Record.new
  end

  def create
    ImportData.new(params[:file]).import
    flash[:notice] = 'Data uploaded successfully'
    redirect_to records_path
  end
end
