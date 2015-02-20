require "rails_helper"

feature "settings page" do
	scenario "user changes the site name", js: true do
		page = SettingsPage.new
		page.set_name 'Testtop Theater'
		expect(page).to have_content('Saved')

		page = HomePage.new
		expect(page).to have_content('Testtop Theater')
	end
	
	scenario "user changes the about page", js: true do
		page = SettingsPage.new
		page.set_about 'Test please ignore'
		expect(page).to have_content('Saved')

		page = AboutPage.new
		expect(page).to have_content('Test please ignore')
	end

	scenario "user password protects the settings page" do
		page = SettingsPage.new
		page.set_admin 'admin', 'password', true

		basic_auth('admin', 'wrongpassword')
		page = page.reload
		expect(page).to have_content('Access denied')

		basic_auth('admin', 'password')
		page = page.reload
		expect(page).to have_content('Password protect this page?')

		page.set_admin '', '', false
		basic_auth('', '')
		page = page.reload
		expect(page).to have_content('Password protect this page?')
	end

	scenario "user changes the banner area", js: true do
		page = SettingsPage.new
		page.set_banner 'This is the banner', false
		expect(page).to have_content('Saved')
		page = HomePage.new
		expect(page).to_not have_content('This is the banner')

		page = SettingsPage.new
		page.set_banner 'This is the banner', true
		expect(page).to have_content('Saved')
		page = HomePage.new
		expect(page).to have_content('This is the banner')
	end

	scenario "user changes the footer", js: true do
		page = SettingsPage.new
		page.set_footer 'This is the footer', false
		expect(page).to have_content('Saved')
		page = HomePage.new
		expect(page).to_not have_content('This is the footer')

		page = SettingsPage.new
		page.set_footer 'This is the footer', true
		expect(page).to have_content('Saved')
		page = HomePage.new
		expect(page).to have_content('This is the footer')
	end

	scenario "user changes the sub-url", js: true do
		page = SettingsPage.new
		page.set_url '/theater'
		expect(page).to have_content('Saved')
		page = HomePage.new
		expect(page.home_link[:href]).to have_content('/theater')
	end
end