json.array! @chats do |chat|
  json.comment simple_format(chat.comment)
  json.created_at I18n.l(chat.created_at, format: :short)
  json.id chat.id
  json.current_user_id current_user.id
  json.comment_user_id chat.user_id
  json.user_nickname chat.user.nickname
end