# encoding: UTF-8

require 'spec_helper'

feature "Create a post", :js do
  scenario %q(
    In order to TDD my shit
    As a developer
    I want to use Javascript in request specs
    ) do
    visit new_post_path
    fill_in 'post_name', with: 'js dammit'
    click_link_or_button 'submit'

    Post.should have(1).record
  end
end