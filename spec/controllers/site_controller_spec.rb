require 'rails_helper'

RSpec.describe SiteController, type: :controller do

  describe "#index" do
    before(:each) do
      get :index
    end

    it "Return var @states with all states name" do
      expect(assigns(:states)).to eq(['Paraná', 'Santa Catarina', 'Rio Grande do Sul'])
    end
    it "Return status 200" do
      expect(response).to have_http_status(200)
    end
  end
end