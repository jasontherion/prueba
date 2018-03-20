require 'rails_helper'

RSpec.describe AtmController, type: :controller do

  describe "GET #Index" do
    it "returns http success" do
      get :Index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #ContarBilletes" do
    it "returns http success" do
      get :ContarBilletes
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #ValorRetirado" do
    it "returns http success" do
      get :ValorRetirado
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #InformeDiario" do
    it "returns http success" do
      get :InformeDiario
      expect(response).to have_http_status(:success)
    end
  end

end
