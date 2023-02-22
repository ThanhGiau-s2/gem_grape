module Api::V1
  class Book < Grape::API
    resource :books do
      desc '=== Get list books ==='
      # /api/v1/books
      get '' do
        books = ::Book.all
        # present books
        present books, with: ::BookEntity
      end
      
      desc 'Return a specific book'
      route_param :id do
        get do
        book = ::Book.find(params[:id])
        present book, with: ::BookEntity
        end
        resource :flows do
          desc 'Create a flow.'
          params do
            requires :flow, type: Hash do
              requires :newStock, type: Integer, desc: 'New Stock.'
              requires :previousStock, type: Integer, desc: 'Previous Stock.'
            end
          end
          post do
            @book = ::Book.find(params[:id])
            @flow = ::Flow.new(params[:flow])
            @flow = @book.flows.create!(params[:flow])
            @book.update(stock: @flow.newStock)
          end
        end # end of return a specific book
      end
    end
  end
end
