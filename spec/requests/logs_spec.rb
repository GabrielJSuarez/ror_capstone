require 'rails_helper'

RSpec.describe "Logs", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/logs/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/logs/create"
      expect(response).to have_http_status(:success)
    end
  end

end
