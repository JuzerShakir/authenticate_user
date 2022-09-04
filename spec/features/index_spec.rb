require "rails_helper"

RSpec.feature "On Home Page, the content", type: :feature do
    before { visit root_path }

    scenario "for non-signed-in visitors" do
        within("header.navbar") do
            expect(page).to have_content("Sign Up")
            expect(page).to have_content("Log In")
        end
        within("h2") { expect(page).to have_content("Hey Devs, Welcome to my Second Rails Project") }
    end


end