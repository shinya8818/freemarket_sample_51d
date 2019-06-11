- if user_signed_in?
  -if item.like_user(current_user.id)
    .like-button
      = link_to item_like_path(item.likes), method: :DELETE, remote: true do
        %i.fas.fa-heart
        %span.favorite いいね！
        %span.favorite
          = item.likes_count

  - else
    .like-button
      = link_to item_likes_path(item), method: :POST, remote: true do
        %i.fas.fa-heart
        %span.favorite いいね！
        %span.favorite
          = item.likes_count

- else
  .like-button
    %i.fas.fa-heart
      %span いいね！
      %span
        = item.likes_count
