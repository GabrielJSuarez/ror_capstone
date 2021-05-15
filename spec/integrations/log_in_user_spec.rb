require 'rails_helper'

RSpec.describe 'Log & Sing in a user', type: :feature do
  describe 'Log in the page' do
    before do
      user = User.create(name: 'Gabriel',
                         email: 'gabriel@example.com',
                         password: 'password',
                         picture: fixture_file_upload('picture.jpg', 'image/jpg'))
      visit unauthenticated_root_path
      click_link('LOG IN')
    end

    it 'Check if user logged in' do
      fill_in 'Email', with: 'gabriel@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content 'Gabriel'
    end

    it 'Check that user could not log in' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

  end

  describe 'Sign up in to the page' do
    describe 'Sign in to the app' do
      before do
        visit unauthenticated_root_path
        click_link('SIGN UP')
      end

      it 'Check if user signed in' do
        fill_in 'Name', with: 'Gabriel Suarez'
        fill_in 'Email', with: 'gabriel111@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password Confirmation', with: 'password'
        attach_file(Rails.root + 'spec/fixtures/files/picture.jpg')
        click_button 'Sign up'
        expect(page).to have_content 'Welcome! You have signed up successfully'
      end

      it 'Check if user didnt signed in' do
        fill_in 'Name', with: 'Gabriel Suarez'
        fill_in 'Email', with: 'gabriel112@example.com'
        fill_in 'Password', with: ''
        fill_in 'Password Confirmation', with: ''
        attach_file(Rails.root + 'spec/fixtures/files/picture.jpg')
        click_button 'Sign up'
        expect(page).to have_content 'Please review the problems below:'
      end

    end
  end
end
