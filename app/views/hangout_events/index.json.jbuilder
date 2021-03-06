json.array!(@hangout_events) do |hangout_event|
  json.extract! hangout_event, :id, :name, :date, :start_time, :end_time
  json.url hangout_event_url(hangout_event, format: :json)
end
