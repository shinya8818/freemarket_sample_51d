json.array! @ancestors do |ancestor|
  json.id ancestor.id
  json.name ancestor.name
  json.ancestry ancestor.ancestry
end
