require 'rails_helper'

RSpec.describe "Records", type: :request do
  describe "GET /index" do
    it 'returns all records' do
      get '/records'
      expect(response.status).to eq 200
    end
  end
end
