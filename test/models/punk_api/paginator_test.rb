require 'test_helper'

module PunkApi
  class PaginatorTest < ActiveSupport::TestCase
    def paginator(page:)
      collection = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11]][page - 1]
      Paginator.new(page:, per_page: 5, collection:)
    end

    test 'only page 1 is the first page' do
      assert paginator(page: 1).first_page?
      assert_not paginator(page: 2).first_page?
    end

    test 'previous page of page 2 is 1' do
      assert 1, paginator(page: 2).previous_page
    end

    test 'pages down to page 2 has a prevoius page' do
      assert paginator(page: 2).previous_page?
      assert_not paginator(page: 1).previous_page?
    end

    test 'next page of page 2 is 3' do
      assert 3, paginator(page: 2).next_page
    end

    test 'pages up to page 2 has a next page' do
      assert paginator(page: 2).next_page?
      assert_not paginator(page: 3).next_page?
    end

    test 'offset of page 3 is 10' do
      paginator = paginator(page: 3)
      assert 10, paginator.offset
    end
  end
end
