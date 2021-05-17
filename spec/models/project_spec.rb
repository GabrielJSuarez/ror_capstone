require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Project association' do
    it { should belong_to(:user) }

    it { should have_many(:logs) }

    it { should have_many(:groups).through(:logs) }
  end

  describe 'Project validations' do
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name).is_at_least(5) }

    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }

    it { should validate_presence_of(:time) }
  end
end
