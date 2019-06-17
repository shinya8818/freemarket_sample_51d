require 'rails_helper'
  describe ItemsController do
    let(:user){ create(:user) }
    describe 'GET #new' do

      context "as an authenticated user" do
        it 'renders the :new template' do
          login_user user
          get :new
          expect(response).to render_template :new
        end
      end

      context 'as without login user' do
        it 'renders the  template' do
          get :new
          expect(response).to redirect_to('http://test.host/users/sign_in')
        end
      end

    end
  end