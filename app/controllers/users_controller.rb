class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @hosted_events = @user.hosted_events
    end
end
