module PunkApi
  class NotFoundError < StandardError
    def initialize(message = 'Not Found')
      super
    end
  end
end
