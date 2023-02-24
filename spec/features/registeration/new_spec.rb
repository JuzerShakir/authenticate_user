require "rails_helper"


RSpec.feature "On Sign up Page, A user", type: :feature do
    let!(:new_user) { build :user }
    let!(:existing_user) { create :user }
    let!(:invalid_email) { build :user, email: "test@invalid" }
    let!(:invalid_password) { build :user, password: "12ABCD"}

    before do
        visit new_user_registration_path
    end

    describe "can sign up" do
        scenario "with valid entries" do
            sign_up_with(new_user)
            expect(page.current_path).to eq(root_path)
            expect(page.status_code).to eq(200)
            expect(user.all.count).to eq(2)
            expect(page).to have_content("You have signed up successfully.")
            within("header.navbar") do
                expect(page).to have_link "Log Out", href: destroy_user_session_path
            end
            within("h2") do
                expect(page).to have_content "Welcome, #{new_user.email}"
            end
        end
    end

    describe "cannot sign up with" do
        scenario "an existing email" do
            sign_up_with(existing_user)
            expect(User.all.count).to eq(1)
            expect(page.current_path).to eq(new_user_registration_path)
            expect(page).to have_content("Email has already been taken")
            expect(page.status_code).to eq(200)
        end

        scenario "an invalid email" do
            sign_up_with(invalid_email)
            expect(User.all.count).to eq(1)
            expect(page.current_path).to eq(new_user_registration_path)
            expect(page).to have_content("Email is invalid")
            expect(page.status_code).to eq(200)
        end

        scenario "empty fields" do
            click_button "Sign up"
            expect(page.current_path).to eq(new_user_registration_path)
            expect(page.status_code).to eq(200)
            expect(page).to have_content("Email can't be blank")
            expect(page).to have_content("Password can't be blank")
        end

        scenario "mis-matched passwords" do
            sign_up_with(invalid_password)
            expect(page.current_path).to eq(new_user_registration_path)
            expect(page.status_code).to eq(200)
            expect(page).to have_content("Password confirmation doesn't match Password")
        end
    end
end