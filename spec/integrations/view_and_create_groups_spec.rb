require 'rails_helper'

RSpec.describe 'View & Create Groups', type: :feature do
  describe 'Create new projects' do
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
      click_link 'All Groups'
      click_link 'New Group'
    end

    it 'creates a new group' do
      fill_in 'group[name]', with: 'Test Group'
      attach_file("#{Rails.root}spec/fixtures/files/picture.jpg")
      click_button 'Create Group'
      expect(page).to have_content 'Group created!'
    end

    it 'fails to creates new project with a group' do
      fill_in 'group[name]', with: ''
      attach_file("#{Rails.root}spec/fixtures/files/picture.jpg")
      click_button 'Create Group'
      expect(page).to have_content 'Name can\'t be blank and Name is too short (minimum is 6 characters)'
    end
  end
end
