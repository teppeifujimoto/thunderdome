require 'rails_helper'

RSpec.describe Beat, type: :model do
  describe '#title' do
    let(:beat){ create(:beat, :second) }

    describe 'validations' do
      before { beat.title = "" }
      subject { beat }
      it { is_expected.not_to be_valid }
    end

    describe 'trait' do
      subject{ beat.title }
      it { is_expected.to eq "my second beat" }
    end

  end
end
