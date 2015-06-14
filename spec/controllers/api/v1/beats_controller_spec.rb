require 'rails_helper'

RSpec.describe Api::V1::BeatsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let!(:beat){create(:beat)}

    it "returns http success" do
      get :show, {:id => beat.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:title){"foo"}
    let(:beat_params){ {beat: {:title => title}} }

    it "returns http success" do
      post :create, beat_params
      expect(response).to have_http_status(:success)
    end

    it "saves Beat model" do
      expect{post :create, beat_params}.to change(Beat, :count).from(0).to(1)
    end

    context 'save falil' do
      let(:title){''}
      it 'returns http error' do
        post :create, beat_params
        expect(response).to have_http_status(:error)
      end
    end
  end

  describe "POST #create" do
    let!(:beat){create(:beat)}
    let(:title){"foo"}
    let(:beat_params){ {id: beat.id,  beat: {:title => title}} }

    before(:each) { put :update, beat_params }

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

    let!(:beat){create(:beat)}
    let(:beat_params){ {id: beat.id} }

    it "returns http success" do
      delete :destroy, beat_params
      expect(response).to have_http_status(:success)
    end

    it "delete Beat" do
      expect{delete :destroy, beat_params}.to change(Beat, :count).from(1).to(0)
    end

  end
end
