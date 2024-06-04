# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @blocks = Block.where(user_id: current_user.id)
  end
end
