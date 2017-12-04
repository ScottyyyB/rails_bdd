require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :email }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
    it { is_expected.not_to allow_value('hotmale').for :email }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :article }
  end
end
