require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Group association model with users' do
    it { should belong_to(:user) }
  end

  describe 'Group association model with events' do
    it { should have_many(:logs) }
  end

  describe 'Group association model with events' do
    it { should have_many(:projects).through(:logs) }
  end
end
