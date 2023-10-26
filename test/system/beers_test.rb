require 'application_system_test_case'

class BeersTest < ApplicationSystemTestCase
  test 'visiting the index page' do
    visit beers_url

    assert_selector 'h1', text: 'Beers'
    assert_selector 'h2', count: 10
  end

  test 'searching for "Berlin" displays 5 results' do
    visit beers_url
    fill_in 'name', with: 'Berlin'

    assert_selector 'h2', count: 5
  end

  test 'searching for "Stockholm" displays no results' do
    visit beers_url
    fill_in 'name', with: 'Stockholm'

    assert_selector 'h2', count: 0
    assert_selector 'p', text: /Your search.*gave no results/
  end

  test 'clicking "Next" displays the next page' do
    visit beers_url
    click_link 'Next'

    assert_text 'Showing 11 to 20'
  end

  test 'searching for "Stout" and navigating to the next page retains the search' do
    visit beers_url(name: 'Stout')
    click_link 'Next'

    assert_current_path beers_url(name: 'Stout', page: 2)
  end

  test 'visiting page 2 and searching for "Stout" does not retain the page' do
    visit beers_url(page: 2)
    fill_in 'name', with: 'Stin'

    assert_current_path beers_url(name: 'Stin')
  end

  test 'visiting an individual beer' do
    beer = Beer.find(1)
    visit url_for(beer)

    assert_selector 'h1', text: beer.name
  end

  test 'visiting a non existing beer raises no error' do
    id = 1000

    assert_raises(PunkApi::NotFoundError) { Beer.find(id) }

    visit beer_url(id:)
  end
end
