class Api::FriendsController < ApplicationController
    before_action :set_friend, only: [:show, :update, :destroy]

    def index
        render json: Friend.all
    end

    def show
        render json: @friend
    end

    def create
        friend = Friend.new(friend_params)

        if friend.save
            render json: friend
        else
            render json: {errors: friend.errors.full_messages}, status: 422
        end
    end

    def update
        if(@friend.update(friend_params))
            render json: @friend
        else
            render json: {errors: @friend.errors.full_messages}, status: 422
        end
    end

    def destroy
        @friend.destroy
    end

    private
    
    def set_friend
        @friend = Friend.find(params[:id])
    end

    def friend_params
        params.require(:friend).permit(:user_id)
    end

end
