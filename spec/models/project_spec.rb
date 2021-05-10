require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Event association model with user' do
    it { should belong_to(:user) }
  end

  describe 'Event association model with groups' do
    it { should have_and_belong_to_many(:groups) }
  end
end
