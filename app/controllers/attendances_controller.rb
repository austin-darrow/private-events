class AttendancesController < ApplicationController
    def create
        event = Event.find(params[:event_id])
        attendance = event.attendances.new(user: current_user)
        if attendance.save
            redirect_to user_path(current_user.id), notice: "You have successfully joined the event!"
        else
            flash.now[:errors] = attendance.errors.full_messages
            render "events/index", status: :unprocessable_entity, locals: { events: Event.all }
        end
    end

    def destroy
    end
end
