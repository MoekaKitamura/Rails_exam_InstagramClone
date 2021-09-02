class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def create
    if logged_in?
      # senderが送り主でrecipientが受取人
      # 該当のユーザ間での会話が過去に存在しているか？
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        # 存在した場合、その会話（チャットルーム）情報を取得
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        # 過去に一件も存在しなかった場合、送られてきたparamsの値を利用して、会話（チャットルーム）情報を生成
        @conversation = Conversation.create!(conversation_params)
      end
      # その会話のチャットルーム(メッセージの一覧画面)へ
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

end
