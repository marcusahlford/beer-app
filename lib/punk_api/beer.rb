module PunkApi
  class Beer < Base
    attribute :abv, :float
    attribute :description, :string
    attribute :food_pairing, default: []
    attribute :id, :integer
    attribute :image_url, :string
    attribute :name

    def self.all(page: nil, name: nil)
      super(page:, beer_name: name)
    end
  end
end
