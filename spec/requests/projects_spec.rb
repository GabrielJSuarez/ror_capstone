require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/projects/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/projects/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/projects/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/projects/show"
      expect(response).to have_http_status(:success)
    end
  end

end
