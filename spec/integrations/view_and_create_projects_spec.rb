require 'rails_helper'

# rubocop:disable all
RSpec.describe 'View & Create Projects', type: :feature do
  describe 'Use profile page links' do
    before do
      User.create(name: 'Gabriel',
                  email: 'gabriel@example.com',
                  password: 'password',
                  picture: fixture_file_upload('picture.jpg', 'image/jpg'))
      visit new_user_session_path
      click_button 'Log in'
      fill_in 'Email', with: 'gabriel@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'See all projects' do
      click_link 'All My Projects'
      expect(page).to have_content 'My Projects'
      expect(page).to have_content 'New Project'
    end

    it 'See all external projects' do
      click_link 'My External Projects'
      expect(page).to have_content 'My External Projects'
      expect(page).to have_content 'New Project'
    end

    it 'See all groups' do
      click_link 'All Groups'
      expect(page).to have_content 'All Groups'
      expect(page).to have_content 'New Group'
    end
  end

  describe 'Create new projects' do
    before do
      user = User.create(name: 'Gabriel',
                         email: 'gabriel@example.com',
                         password: 'password',
                         picture: fixture_file_upload('picture.jpg', 'image/jpg'))
      user.groups.build(name: 'Test Group', group_image: fixture_file_upload('picture.jpg', 'image/jpg')).save
      visit new_user_session_path
      click_button 'Log in'
      fill_in 'Email', with: 'gabriel@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'All My Projects'
      click_link 'New Project'
    end

    it 'creates new project ' do
      fill_in 'project[name]', with: 'Test Project'
      fill_in 'project[time]', with: '1'
      click_button 'Create Project'
      expect(page).to have_content 'My External Projects'
      expect(page).to have_content 'Project created successfully!'
    end

    it 'creates new project' do
      fill_in 'project[name]', with: 'Test Project'
      fill_in 'project[time]', with: '1'
      click_button 'Create Project'
      expect(page).to have_content 'My External Projects'
      expect(page).to have_content 'Project created successfully!'
    end
  end
end
# rubocop:enable all
