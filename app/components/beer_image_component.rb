class BeerImageComponent < ViewComponent::Base
  def initialize(beer, size: :md)
    @beer = beer
    @size = size
  end

  def call
    if @beer.image_url.present?
      image_tag @beer.image_url, alt: @beer.name, class: "object-contain w-full #{height_class} p-5"
    else
      tag.div('', class: "w-full #{height_class} p-5")
    end
  end

  private

  def height_class
    @size == :xl ? 'h-96' : 'h-48'
  end
end
