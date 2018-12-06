class CommentsController < ApplicationController
  def index
    @comments = Comment.where(topic_id: params[:topic_id]).includes(:user)
    @new_comment = Comment.new
    
  end

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
    comment.comment = params[:comment][:comment]

    if comment.save
      redirect_to comments_path(topic_id: params[:topic_id]), success: '投稿に成功しました'
    else
      redirect_to comments_path(topic_id: params[:topic_id]), danger: '投稿に登録に失敗しました'
    end
  end

end
