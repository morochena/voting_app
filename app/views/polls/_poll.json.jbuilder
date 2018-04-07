json.extract! poll, :id, :title, :option1, :option2, :option3, :option4, :option5, :option6, :user_id, :created_at, :updated_at
json.url poll_url(poll, format: :json)
