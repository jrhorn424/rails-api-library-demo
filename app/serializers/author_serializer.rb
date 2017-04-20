class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :family_name, :given_name
end
