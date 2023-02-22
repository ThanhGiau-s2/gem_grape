class BookEntity < Grape::Entity
  expose :isbn
  expose :title
  expose :stock
  expose :flows, using: FlowEntity
end
