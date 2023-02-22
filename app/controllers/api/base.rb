require 'grape-swagger'

module Api
  class Base < Grape::API
    prefix 'api'
    version 'v1', using: :path
    format :json

    mount Api::V1::Application
    add_swagger_documentation
  end
end
