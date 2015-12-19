require 'rails_helper'

RSpec.feature "User deletes existing artist" do
  scenario "they delete single artist" do
    artist_name1       = "Bob Marley"
    artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist1 = {name: artist_name1, image_path: artist_image_path1}

    artist = Artist.create(artist1)

    visit artist_path(artist)
    expect(page).to have_content "Bob Marley"
    click_on "Delete"
    expect(page).to have_content "All Artists"
    expect(page).to_not have_content "Bob Marley"
    expect(current_path).to eq(artists_path)

  end
end

# Write and implement a feature test for deleting an artist (spec/features/user_deletes_an_artist_spec.rb):
#
# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Delete"
# Then I should be back on the artist index page
# Then I should not see the artist's name
