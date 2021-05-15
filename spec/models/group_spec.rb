require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Group association' do
    it { should belong_to(:user) }

    it { should have_many(:logs) }

    it { should have_many(:projects).through(:logs) }

    it { should have_one_attached(:group_image) }
  end

  describe 'Group Validations' do
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name).is_at_least(6) }

    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }

    it { should validate_presence_of(:group_image).with_message('Need a picture!') }
  end
end
