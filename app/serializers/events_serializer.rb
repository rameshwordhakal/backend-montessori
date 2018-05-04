class EventsSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :user_id
end