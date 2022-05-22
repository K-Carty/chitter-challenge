feature 'homepage' do
  scenario 'it loads the homepacge' do 
  visit('/')
  expect(page).to have_content 'Lets Goo!'
  end 
end 
