class AddresSerializer < ActiveModel::Serializer
  attributes :id, :street, :city
end