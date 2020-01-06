# require('capybara/rspec')
# require('./app')
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
#
#
#
# describe('#app') do
#
#   before :each do
#     Stage.clear
#     Artist.clear
#   end
#
#   describe('create a stage path', {:type => :feature}) do
#     it('creates a stage and then goes to the stage page') do
#       visit('/LOTR_Fest')
#       # save_and_open_page
#       click_on('Add a New Stage!')
#       fill_in('stage_name', :with => 'Hobo-town')
#       click_on('Add Stage')
#       expect(page).to have_content('Hobo-town')
#     end
#   end
#
#   describe('create an artist path', {:type => :feature}) do
#     it('creates an artist and then goes to the artist page') do
#       stage = Stage.new(nil, "Margaritaville", "Florida", "Saturday")
#       stage.save
#       visit("LOTR_Fest/#{stage.id}/new_artist")
#       fill_in('artist_name', :with => 'Beyonce')
#       click_on('Add Performer')
#       expect(page).to have_content('Beyonce')
#     end
#   end
#
#   describe('create a stage edit path', {:type => :feature}) do
#     it('edits a stage and then goes to the stage page') do
#       stage = Stage.new(nil, "Margaritaville", "Florida", "Saturday")
#       stage.save
#       visit("/LOTR_Fest/#{stage.id}")
#       # save_and_open_page
#       click_on('Edit Stage Info')
#       fill_in('stage_name', :with => 'Hobbiton')
#       click_on('Update')
#       expect(page).to have_content('Hobbiton')
#     end
#   end
#
#   describe('create an artist edit path', {:type => :feature}) do
#     it('edits an artist and then goes to the artist page') do
#       stage = Stage.new(nil, "Margaritaville", "Florida", "Saturday")
#       stage.save
#       artist = Artist.new("Beyonce", nil, "hip-hop", stage.id)
#       artist.save
#       visit("LOTR_Fest/#{stage.id}/artist/#{artist.id}")
#       click_on('Edit Artist Info')
#       fill_in('artist_name', :with => 'Jay-Z')
#       click_on('Save Edit')
#       expect(page).to have_content('Jay-Z')
#     end
#   end
#
#   describe('create a stage delete path', {:type => :feature}) do
#     it('deletes a stage and then goes to the home page') do
#       stage = Stage.new(nil, "Margaritaville", "Florida", "Saturday")
#       stage.save
#       visit("/LOTR_Fest/#{stage.id}")
#       # save_and_open_page
#       click_on('Edit Stage Info')
#       click_on('Delete Stage')
#       expect(page).to_not have_content('Margaritaville')
#     end
#   end
#
#   describe('create an artist delete path', {:type => :feature}) do
#     it('deletes an artist and then goes to the stage page') do
#       stage = Stage.new(nil, "Margaritaville", "Florida", "Saturday")
#       stage.save
#       artist = Artist.new("Beyonce", nil, "hip-hop", stage.id)
#       artist.save
#       visit("LOTR_Fest/#{stage.id}/artist/#{artist.id}")
#       click_on('Edit Artist Info')
#       click_on('Delete Artist')
#       expect(page).to_not have_content('Beyonce')
#     end
#   end
#
# end
