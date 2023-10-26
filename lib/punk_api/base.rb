module PunkApi
  class Base
    DEFAULT_PER_PAGE = 10

    extend ActiveModel::Naming
    include ActiveModel::Attributes
    include ActiveModel::AttributeAssignment
    include ActiveModel::Conversion

    def persisted? = true

    class << self
      def all(**params)
        page = params[:page]&.to_i || 1
        per_page = params[:per_page] || DEFAULT_PER_PAGE

        collection = client.find_all(path:, params: { page:, per_page:, **params }).map { build(_1) }

        Paginator.new(page:, per_page:, collection:)
      end

      def find(id)
        build(client.find_by_id(id, path:))
      end

      private

      def client
        @client ||= Client.new
      end

      def build(attributes)
        new.tap do |object|
          object.assign_attributes(attributes.slice(*attribute_names))
        end
      end

      def path = name.demodulize.underscore.pluralize
    end
  end
end
