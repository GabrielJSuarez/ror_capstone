# rubocop:disable all
#
# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, except: ['landing']
  def home; end

  def landing; end
end
# rubocop:enable all
