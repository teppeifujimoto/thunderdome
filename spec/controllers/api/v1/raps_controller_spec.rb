require 'rails_helper'

RSpec.describe Api::V1::RapsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let!(:rap){create(:rap)}

    it "returns http success" do
      get :show, {:id => rap.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:beat){create(:beat)}
    let(:title) {'hoge'}
    let(:rap_params){ {beat_id: beat.id, rap: attributes_for(:rap, title: title)} }

    it "returns http success" do
      post :create, rap_params
      expect(response).to have_http_status(:success)
    end

    it "saves Beat model" do
      expect{post :create, rap_params}.to change(Rap, :count).from(0).to(1)
    end

    context 'save falil' do
      let(:title){''}
      it 'returns http error' do
        post :create, rap_params
        expect(response).to have_http_status(:error)
      end
    end
  end

  describe "PUT #update" do
    let!(:rap){create(:rap)}
    let(:title){"foo"}
    let(:rap_params){ {id: rap.id,  rap: {:title => title}} }

    before(:each) { put :update, rap_params }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    context 'update fail' do
      let(:title){''}
      it 'return http error' do
        expect(response).to have_http_status(:error)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:rap){create(:rap)}
    let(:rap_params){ {id: rap.id} }

    it "returns http success" do
      delete :destroy, rap_params
      expect(response).to have_http_status(:success)
    end

    it "delete Beat" do
      expect{delete :destroy, rap_params}.to change(Rap, :count).from(1).to(0)
    end
  end

end
