json.created_at I18n.l(@chat.created_at, format: :short)
json.comment simple_format(@chat.comment)