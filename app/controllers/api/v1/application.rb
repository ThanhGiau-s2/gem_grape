module Api::V1
  class Application < Grape::API
    mount Api::V1::Book
  end
end
