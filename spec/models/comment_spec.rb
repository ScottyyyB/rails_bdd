require 'rails_helper'
require "validates_email_format_of/rspec_matcher"

RSpec.describe Comment, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :email }
    it { is_expected.to belong_to :article }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_email_format_of(:email).with_message('is not valid') }
  end
end
