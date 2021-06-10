require 'rails_helper'

describe BookSuggestion do
  context 'with valid model' do
    subject(:book_suggestion) { build(:book_suggestion) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:editor) }
    it { is_expected.to validate_presence_of(:year) }
  end

  context 'with invalid model' do
    subject(:book_suggestion) { build(:book_suggestion, author: nil) }
    it { is_expected.not_to be_valid }
  end
end
