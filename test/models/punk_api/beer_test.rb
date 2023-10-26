require 'test_helper'

module PunkApi
  class BeerTest < ActiveSupport::TestCase
    setup do
      VCR.insert_cassette(name, record: :new_episodes)
    end

    teardown do
      VCR.eject_cassette
    end

    test 'Beer#all returns a paginator object with beers' do
      assert_instance_of Paginator, Beer.all
      assert_instance_of Beer, Beer.all.first
    end

    test 'attributes of beer with id 1' do
      beer = Beer.find(1)

      assert_equal beer.id, 1
      assert_equal beer.abv, 4.5
      assert_equal beer.description,
                   'A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.'
      assert_equal beer.food_pairing,
                   ['Spicy chicken tikka masala', 'Grilled chicken quesadilla', 'Caramel toffee cake']
      assert_equal beer.image_url, 'https://images.punkapi.com/v2/keg.png'
      assert_equal beer.name, 'Buzz'
    end

    test 'a non existing beer id raises an error' do
      assert_raises(NotFoundError) { Beer.find(1000) }
    end

    test 'first beer id on page 1 should be 1' do
      assert_equal Beer.all.first.id, 1
    end

    test 'first beer id on page 2 should be 11' do
      assert_equal Beer.all(page: 2).first.id, 11
    end

    test 'no beers on page 1000' do
      assert_empty Beer.all(page: 1000)
    end

    test 'search on "Stockholm" gives no results' do
      assert_empty Beer.all(name: 'Stockholm')
    end

    test 'search on "Berlin" gives results' do
      assert_not_empty Beer.all(name: 'Berlin')
    end

    test 'search on "Berlin" gives no results on page 2' do
      assert_empty Beer.all(name: 'Berlin', page: 2)
    end
  end
end
