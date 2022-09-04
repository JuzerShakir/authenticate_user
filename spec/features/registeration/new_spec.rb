require "rails_helper"


RSpec.feature "On Sign up Page, A Visitor", type: :feature do
    let!(:new_visitor) { build :visitor }
    let!(:existing_visitor) { create :visitor }
    let!(:invalid_email) { build :visitor, email: "test@invalid" }
    let!(:invalid_password) { build :visitor, password: "12ABCD"}

    before do
        visit new_visitor_registration_path
    end

    describe "can sign up" do
        scenario "with valid entries" do
            sign_up_with(new_visitor)
            expect(page.current_path).to eq(root_path)
            expect(page.status_code).to eq(200)
            expect(Visitor.all.count).to eq(2)
            expect(page).to have_content("You have signed up successfully.")
            within("header.navbar") do
                expect(page).to have_link "Log Out", href: destroy_visitor_session_path
            end
            within("h2") do
                expect(page).to have_content "Welcome, #{new_visitor.email}"
            end
        end
    end

    describe "cannot sign up with" do
        scenario "an existing email" do
            sign_up_with(existing_visitor)
            expect(Visitor.all.count).to eq(1)
            expect(page.current_path).to eq(new_visitor_registration_path)
            expect(page).to have_content("Email has already been taken")
            expect(page.status_code).to eq(200)
        end

        scenario "an invalid email" do
            sign_up_with(invalid_email)
            expect(Visitor.all.count).to eq(1)
            expect(page.current_path).to eq(new_visitor_registration_path)
            expect(page).to have_content("Email is invalid")
            expect(page.status_code).to eq(200)
        end

        scenario "empty fields" do
            click_button "Sign up"
            expect(page.current_path).to eq(new_visitor_registration_path)
            expect(page.status_code).to eq(200)
            expect(page).to have_content("Email can't be blank")
            expect(page).to have_content("Password can't be blank")
        end

        scenario "mis-matched passwords" do
            sign_up_with(invalid_password)
            expect(page.current_path).to eq(new_visitor_registration_path)
            expect(page.status_code).to eq(200)
            expect(page).to have_content("Password confirmation doesn't match Password")
        end
    end
end