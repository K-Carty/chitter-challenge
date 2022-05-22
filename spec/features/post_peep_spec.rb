feature 'post peep' do
  scenario ' post a message (peep) to chitter' do 
  visit('/peeps')
  fill_in 'peep_content', with: 'test_peep'
  click_button('Post')
  expect(page).to have_content 'test_peep'
  end 
end 
