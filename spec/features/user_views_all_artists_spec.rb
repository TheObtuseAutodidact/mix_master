require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see a page listing all artists" do
    artist_name1       = "Bob Marley"
    artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist1 = {name: artist_name1, image_path: artist_image_path1}

    Artist.create(artist1)

    artist_name2      = "Bob Dylan"
    artist_image_path2 = "http://www.tellus360.com/wp-content/uploads/2015/04/bob_dylan.jpg"

    artist2 = {name: artist_name2, image_path: artist_image_path2}

    Artist.create(artist2)
    visit artists_path

    expect(page).to have_content(artist_name1)
    expect(page).to have_content(artist_name2)

    click_on("Bob Marley")

    expect(page).to have_content(artist_name1)
    expect(page).to have_css("img[src=\"#{artist_image_path1}\"]")
    #  assert_equal artist_path(@artist), current_path     rspec version of this?

###################
    click_on("<< Back to Index")
################                    not in spec as writtn, added to make this all one test

    expect(page).to have_content(artist_name1)
    expect(page).to have_content(artist_name2)

    click_on("Bob Dylan")
    expect(page).to have_content(artist_name2)
    expect(page).to have_css("img[src=\"#{artist_image_path2}\"]")
  end
end
    # Write and implement a feature test for viewing all artists (spec/features/user_views_all_artists_spec.rb):
    #
    # As a user
    # Given that artists exist in the database
    # When I visit the artists index
    # Then I should see each artist's name
    # And each name should link to that artist's individual page
