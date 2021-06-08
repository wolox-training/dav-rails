require 'rails_helper'

describe Book do
  context 'with valid model' do
    subject(:book) { build(:book) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:editor) }
    it { is_expected.to validate_presence_of(:year) }
  end

  context 'with invalid model' do
    subject(:book) { build(:book, genre: nil) }
    it { is_expected.not_to be_valid }
  end
end
