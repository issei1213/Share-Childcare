json.created_at I18n.l(@chat.created_at, format: :short)
json.comment simple_format(@chat.comment)
json.user_nickname @chat.user.nickname
json.id @chat.id
json.current_user_id current_user.id
json.comment_user_id @chat.user_id