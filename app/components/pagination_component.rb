class PaginationComponent < ViewComponent::Base
  def initialize(paginator:, url: ->(page) { url_for(paginator.entries, page:) })
    @paginator = paginator
    @url = url
  end

  def render?
    @paginator.present?
  end
end
