module PunkApi
  class Paginator
    include Enumerable

    delegate_missing_to :@collection

    def initialize(page:, per_page:, collection:)
      @page = page
      @per_page = per_page
      @collection = collection
    end

    def first_page?
      @page == 1
    end

    def previous_page
      @page - 1
    end

    def previous_page?
      previous_page.positive?
    end

    def next_page
      @page + 1
    end

    def next_page?
      @per_page == @collection.size
    end

    def offset
      (@page - 1) * @per_page
    end
  end
end
