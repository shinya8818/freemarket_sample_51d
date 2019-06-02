require 'rails_helper'

describe HomeController do
  describe 'GET #index' do
    it "populates an array of items " do
      items = create_list(:item, 3)
      get :index
      expect(assigns(:items)).to match(items)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
