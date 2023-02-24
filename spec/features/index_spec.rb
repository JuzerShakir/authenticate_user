require "rails_helper"

RSpec.feature "On Home Page,", type: :feature do
    let!(:existing_user) { create :user }
    before { visit root_path }

    describe "the content" do
        scenario "for non-signed-in users" do
            within("header.navbar") do
                expect(page).to have_content("Sign Up")
                expect(page).to have_content("Log In")
            end
            within("h2") { expect(page).to have_content("Hey Devs, Welcome to my Second Rails Project") }
        end

        scenario "for signed-in users" do
            sign_in_with(existing_user)
            expect(page).to have_content("Signed in successfully.")
            within("header.navbar") do
                expect(page).to have_link "Log Out", href: destroy_user_session_path
            end
            within("h2") { expect(page).to have_content("Welcome, #{existing_user.email}") }
        end
    end

    describe "when user clicks on log out" do
        before do
            sign_in_with(existing_user)
            click_on "Log Out"
        end

        scenario "should log out user" do
            expect(page.current_path).to eq(root_path)
            expect(page).to have_content("Signed out successfully.")
        end
    end

end