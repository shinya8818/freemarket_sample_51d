json.array! @siblings do |sibling|
  json.id sibling.id
  json.name sibling.name
  json.ancestry sibling.ancestry
end
