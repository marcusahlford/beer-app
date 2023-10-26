class PaginationNextLinkComponent < PaginationLinkComponent
  def render? = @paginator.next_page?

  def page = @paginator.next_page

  def link_text = 'Next'

  def direction = :right

  def svg_path_data = 'M2 10a.75.75 0 01.75-.75h12.59l-2.1-1.95a.75.75 0 111.02-1.1l3.5 3.25a.75.75 0 010 1.1l-3.5 3.25a.75.75 0 11-1.02-1.1l2.1-1.95H2.75A.75.75 0 012 10z'
end
