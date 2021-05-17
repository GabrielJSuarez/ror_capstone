require 'rails_helper'

RSpec.describe Log, type: :model do
  describe 'Log association' do
    it { should belong_to(:group) }

    it { should belong_to(:group) }
  end

  describe 'Log Validation' do
    it { should validate_presence_of(:project_id) }
  end
end
