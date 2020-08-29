class UsersController < ApplicationController
     def index
      @users = User.all
    end


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to action: "index"
            if UserMailer.welcome_email(@user).deliver_now
                puts "Email sent succesfully"
            end
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        @user.update(user_params)
        redirect_to action: "index"
    end


    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to action: "index"
    end

     # Only allow a list of trusted parameters through.
    private
    def user_params
      params.require(:user).permit(:name, :id, :role, :trade, :email, :vendor, :ref_submitted_RFA, :ref_submitted_RFI, :ref_handled_RFA,
      :ref_handled_RFI, :ref_assigned_RFA, :ref_assigned_RFI)
    end

end
