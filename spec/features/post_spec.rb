require 'rails_helper'

describe 'new post' do 
  it 'ensures that the form route works with the /new action' do
    visit new_post_path
    expect(page.status_code).to eq(200) 
  end

  it 'renders HTML in the /new template ' do
    visit new_post_path
    expect(page).to have_content('Post Form')
  end

  it "displays a new post form that redirects to the index page, which then contains the submitted post's title and description" do
    visit new_post_path # show new post form
    fill_in 'post_title', with: 'My post title' # fill in title
    fill_in 'post_description', with: 'My post description' # fill in description

    click_on 'Submit Post'  # submit form

    expect(page.current_path).to eq(posts_path) # redirect to index
    expect(page).to have_content('My post title') # check for title
    expect(page).to have_content('My post description') # check for description
  end
end