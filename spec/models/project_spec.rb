require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Event association model with user' do
    it { should belong_to(:user) }
  end

  describe 'Group association model with events' do
    it { should have_many(:logs) }
  end

  describe 'Group association model with events' do
    it { should have_many(:groups).through(:logs) }
  end
end
