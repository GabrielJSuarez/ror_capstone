require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User association model with events' do
    it { should have_many(:events).with_foreign_key('author_id') }
  end

  describe 'User association model with groups' do
    it { should have_many(:groups) }
  end
end
