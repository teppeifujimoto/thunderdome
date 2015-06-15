require 'rails_helper'

RSpec.describe "Beats", type: :request do
  describe 'GET /api/v1/beats' do

    it 'return status code 200' do
      get '/api/v1/beats'
      expect(response.status).to eq(200)
    end

  end

  describe 'GET /api/v1/beats/:id' do

    let!(:beat){create(:beat)}
    before(:each){ get "/api/v1/beats/#{beat.id}" }

    it 'return status code 200' do
      expect(response.status).to eq(200)
    end

    it 'return Beat' do
      json = JSON.parse(response.body)
      expect(json['beat']['id']).to eq(beat.id)
    end
  end

  describe 'POST /api/v1/beats' do
    let(:title){ 'hoge' }
    let(:beat_params){ {beat: attributes_for(:beat, title: title)} }

    before(:each){ post "/api/v1/beats", beat_params }

    context '有効なパラメータなら' do
      it 'return status code 200' do
        expect(response.status).to eq(200)
      end

      it '作成したBeatを返すこと' do
        json = JSON.parse(response.body)
        expect(json['beat']['title']).to eq(title)
      end
    end

    context '無効なパラメータなら' do
      let(:title){ '' }
      it 'returns status code 400' do
        expect(response.status).to eq(400)
      end
    end
  end

  describe 'PUT /api/v1/beats/:id' do
    let!(:beat){create(:beat)}
    let(:title){"foo"}
    let(:beat_params){ {id: beat.id,  beat: {:title => title}} }

    before(:each) { put "/api/v1/beats/#{beat.id}", beat_params }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns updated Beat" do
      json = JSON.parse(response.body)
      expect(json['beat']['title']).to eq(title)
    end

    context 'update fail' do
      let(:title){''}
      it 'return http error' do
        expect(response.status).to eq(400)
      end
    end

  end

  describe 'DELETE /v1/beats/:id' do
    let!(:beat){create(:beat)}

    it 'return status 200' do
      delete "/api/v1/beats/#{beat.id}"
      expect(response.status).to eq(200)
    end

    it 'Beatを削除すること' do
      expect{delete "/api/v1/beats/#{beat.id}"}.to change(Beat, :count).from(1).to(0)
    end

  end
end
