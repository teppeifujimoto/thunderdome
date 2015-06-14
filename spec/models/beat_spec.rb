require 'rails_helper'

RSpec.describe Beat, type: :model do
  describe '#title' do
    let(:beat){ create(:beat) }

    describe 'validations' do
      before { beat.title = "" }
      subject { beat }
      it { is_expected.not_to be_valid }
    end

  end
end
