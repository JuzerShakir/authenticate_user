require "rails_helper"

RSpec.feature "On Home Page, the content", type: :feature do
    let!(:existing_visitor) { create :visitor }

    before { visit root_path }

    scenario "for non-signed-in visitors" do
        within("header.navbar") do
            expect(page).to have_content("Sign Up")
            expect(page).to have_content("Log In")
        end
        within("h2") { expect(page).to have_content("Hey Devs, Welcome to my Second Rails Project") }
    end

    scenario "for signed-in visitors" do
        sign_in_with(existing_visitor)
        expect(page).to have_content("Signed in successfully.")
        within("header.navbar") do
            expect(page).to have_link "Log Out", href: destroy_visitor_session_path
        end
        within("h2") do
            expect(page).to have_content("Welcome, #{existing_visitor.email}")
        end
    end
end