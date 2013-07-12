def mutuals?(client, handle1, handle2)
  client.friendship?(handle1, handle2) && client.friendship?(handle2, handle1)
end

def shared(client, handle1, handle2)
  ids = client.friend_ids(handle1).all & client.friend_ids(handle2).all
  ids.map { |id| client.user(id).handle }
end