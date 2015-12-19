require 'rails_helper'

RSpec.feature "User can edit existing artist" do
  scenario "they can edit artist info from individual artist's page" do
    artist_name1       = "Bob Marley"
    artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist1 = {name: artist_name1, image_path: artist_image_path1}

    artist = Artist.create(artist1)

    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: "Mr. Robert Marley"
    fill_in "artist_image_path", with: artist_image_path1
    click_on "Update Artist"



    expect(page).to have_content("Mr. Robert Marley")
    expect(page).to have_css("img[src=\"#{artist_image_path1}\"]")
  end
end

# Write and implement a feature test for editing an artist (spec/features/user_edits_an_artist_spec.rb):
#
# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Edit"
# And I fill in a new name
# And I click on "Update Artist"
# Then I should see the artist's updated name
# Then I should see the existing image
