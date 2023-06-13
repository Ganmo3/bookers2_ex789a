class DirectMessagesController < ApplicationController
  
def create
  if Entry.where(user_id: current_user.id, room_id: params[:direct_message][:room_id]).present?
    @message = DirectMessage.create(params.require(:direct_message).permit(:message, :user_id, :content, :room_id).merge(user_id: current_user.id))
  else
    flash[:alert] = "メッセージ送信に失敗しました。"
  end
  redirect_to room_path(@message.room_id)
end

  def destroy
    @message = DirectMessage.find(params[:id])
    @message.destroy
    redirect_to room_path(@message.room_id), notice: "メッセージを削除しました。"
  end

end
