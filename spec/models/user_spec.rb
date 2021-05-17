require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User association model with events' do
    it { should have_many(:projects).with_foreign_key('author_id') }

    it { should have_many(:groups) }

    it { should have_one_attached(:picture) }
  end

  describe 'User validations' do
    it { should validate_presence_of(:picture).with_message('Need a picture!') }
  end
end
