require 'rails_helper'

describe Rent do
  context 'with valid model' do
    subject(:rent) { build(:rent) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:book) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
  end

  context 'with invalid model' do
    subject(:rent) { build(:rent, start_date: nil) }
    it { is_expected.not_to be_valid }
  end
end
