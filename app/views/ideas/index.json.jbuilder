json.array!(@ideas) do |idea|
  json.extract! idea, :id, :author_id, :title, :description, :video_url
  json.url idea_url(idea, format: :json)
end
