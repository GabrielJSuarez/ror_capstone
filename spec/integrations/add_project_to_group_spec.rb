require 'rails_helper'

RSpec.describe 'View and add projects to group', type: :feature do
  describe 'Create new association' do
    before do
      user = User.create(name: 'Gabriel',
                         email: 'gabriel@example.com',
                         password: 'password',
                         picture: fixture_file_upload('picture.jpg', 'image/jpg'))
      visit new_user_session_path
      click_button 'Log in'
      fill_in 'Email', with: 'gabriel@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      Group.create(user: user, name: 'Test Group', group_image: fixture_file_upload('picture.jpg', 'image/jpg'))
      Project.create(name: 'Project', time: '1', user: user)
      click_link 'All Groups'
      click_link 'Test Group'
    end

    it 'Check access to the group' do
      expect(page).to have_content 'Test group Projects'
    end
  end
end
