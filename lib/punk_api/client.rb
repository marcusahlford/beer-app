module PunkApi
  class Client
    BASE_URL = 'https://api.punkapi.com/v2/'.freeze

    def find_all(path:, params: {})
      get(path:, params:)
    end

    def find_by_id(id, path:)
      get(path: "#{path}/#{id}")[0]
    end

    private

    def get(path:, params: {})
      result = connection.get(path, params.compact_blank)

      result.status == 404 ? raise(NotFoundError) : result.body
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |connection|
        connection.response :json
      end
    end
  end
end
