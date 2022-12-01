require 'rails_helper'

RSpec.describe "Helps::Manuals", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/helps/manuals/show"
      expect(response).to have_http_status(:success)
    end
  end

end
