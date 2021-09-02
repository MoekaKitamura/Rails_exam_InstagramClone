class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # pictureをパラメータの値から探し出し,pictureに紐づくcommentsとしてbuildします。
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params) #@pictureのidをpicture_idに含んだ状態のCommentインスタンスをnew(作成)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to picture_path(@picture) }
      else
        format.html { redirect_to picture_path(@picture), notice: '投稿できませんでした...' }
      end
    end
  end
  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:picture_id, :content)
  end
end
