require 'rails_helper'

feature "Admin adds a picture", %q(

[ ] I must be able to add an image
[ ] I must be able to leave a description of the image
) do

  scenario "admin adds image and description", focus: true do
    admin_user = FactoryGirl.create(:user, admin: true)

    sign_in_as(admin_user)

    visit root_path

    click_on "Add Image"

    #attach_file('cody17.jpg', 'app/assets/images/cody17.jpg')
    fill_in "description", with: "Cutest dog ever!"

    expect(page).to have_content "Cutest dog ever!"

  end
end
