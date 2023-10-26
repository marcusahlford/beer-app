class PaginationLinkComponent < ViewComponent::Base
  def initialize(paginator:, url:)
    @paginator = paginator
    @url = url
  end

  def icon_last?
    direction == :right
  end
end
