json.array! @notifications do |notification|
  json.id notification.id
  json.actor notification.actor.full_name
  json.action notification.action
  json.notifiable do
    if notification.notifiable.class == Notice
      json.type "un aviso"
    end
  end
  # Create a condition to determine wether to use the
  # index path or show path
  if [ Notice ].include? notifiable.class
    json.url eval("#{notification.notifiable.class.to_s.pluralize.downcase}_path( anchor: dom_id( notification.notifiable ) )")
  else
    json.url eval("#{notification.notifiable.class.to_s.downcase}_path( anchor: dom_id( notification.notifiable ) )")
  end
end
