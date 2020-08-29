class RfasController < ApplicationController

     def index

        @rfa = Rfa.new
        @rfas = Rfa.all.where(is_latest: true) #display only latest revision of rfa

        respond_to do |format|
            format.html
            format.xlsx #use for exporting to excel
        end

        #filtering block of code
        if params[:status].present?
            @rfas = @rfas.where(status: params[:status])
        end
        if params[:completed].present?
            @rfas = @rfas.where(completed: params[:completed])
        end
        if params[:lagging].present?
            if params[:lagging] == "15"
                @rfas = @rfas.where("days_lagging >= ?" ,15)
            else
                @rfas = @rfas.where("days_lagging <= ?", params[:lagging])
            end
        end
        if params[:created].present?
            if params[:created] == "0"
                @rfas = @rfas.where("issued_date = ?", DateTime.now)
            end
            if params[:created] == "7"
                @rfas = @rfas.where("issued_date < ?", DateTime.now)
            end
        end

    end

    def new
        @rfa = Rfa.new
    end

    def create
        @rfa = Rfa.new(rfa_params)

        @rfa.rev = "A" #auto generate first revision of RFA
        @rfa.is_latest = true #set new rfa to be latest revision

        if  @rfa.issued_date.nil? #set default RFA issued date if user left it blank
            @rfa.issued_date = Time.now.strftime("%d/%m/%y %I:%M %P")
        end

        # constructing the ref string
        @rfa.ref = "" + @rfa.project.title.to_s.upcase + "-" + @rfa.trade.to_s.upcase + "-" + @rfa.sheet_name.to_s.upcase + "-" + @rfa.request_type.to_s.upcase

        if @rfa.save
            redirect_to action: "index"
            flash[:created] = "RFA Successfully Created"
        else
            puts @rfa.errors.messages
            render "new"

        end
    end

    def edit
        @rfa = Rfa.find(params[:id])
        respond_to do |format|
            format.html
        end

    end

    def update
        @rfa = Rfa.find(params[:id])

        if @rfa.update(rfa_params)
            @rfa.ref = "" + @rfa.project.title.to_s.upcase + "-" + @rfa.trade.to_s.upcase + "-" + @rfa.sheet_name.to_s.upcase + "-" + @rfa.request_type.to_s.upcase
            if @rfa.save!
                redirect_to action: "show", :id =>@rfa.id
                flash[:updated] = "RFA Successfully Updated"
            else
                puts "failure"
                puts @rfa.errors.messages
                render 'edit'
            end

        else
            render "edit"
            #redirect_to action: "show", :id =>@rfa.id
        end
    end


    def show
        @rfa = Rfa.find(params[:id])

    end

    def dashboard
        #so that dashboard can access rfa data
        @rfas = Rfa.all.where(is_latest: true)
    end

    def project_dashboard
        @projects = Project.all
    end

    def destroy
        @rfa = Rfa.find(params[:id])
        @rfa.destroy
        redirect_to action: "index"
        flash[:deleted] = "RFA Successfully Deleted"
    end

    def remove_old_revisions #remove all old revisions of an RFA, leaving only the latest
        @rfa = Rfa.find(params[:id])
        @rfas = Rfa.all.where(is_latest: false, ref: @rfa.ref)
        if not @rfas.nil?
            @rfas.each do |rfa|
                rfa.destroy
            end
        end

        redirect_to request.referrer
        flash[:remove_old_rev] = "All Old Revisions Successfully Deleted!"
    end

    def delete_attachment
        @attachment = ActiveStorage::Attachment.find(params[:id])
        @attachment.purge

        redirect_to request.referrer #back to previous page
    end

    def reject_rfa #method to increment rfa to next rev, and duplicate the rfa with the old rev, then set is_latest to false.
        @rfa = Rfa.find(params[:id])

        @rfa_new = @rfa.amoeba_dup #new rfa
        @rfa_new.rev = @rfa_new.rev.next!
        @rfa_new.save

        @rfa.is_latest = false #old rfa
        @rfa.save


        flash[:reject] = "New revision of RFA created!"
        redirect_to action: "show", :id=> @rfa_new.id #display latest rev of RFA

    end

    def rfa_email_send #method that sends list of open RFAs to a list of users every time interval defined
        @users = User.all

        @users.each do |user|
            if UserMailer.welcome_email(user).deliver_now
                puts "Email sent succesfully"
            end
        end

    end



     # Only allow a list of trusted parameters through.
    private
    def rfa_params
      params.require(:rfa).permit(:ref,
        :project_id,
        :request_type,
        :completed,
        :number,
        :rev,
        :subject,
        :issued_date,
        :required_reply_date,
        :to,
        :reply_date,
        :approval_date,
        :replied_by,
        :status,
        :days_lagging,
        :count,
        :transmittal_advice,
        :remarks,
        :trade,
        :emailed_to,
        :sheet_name,
        :gridline,
        :email_lists_attributes => [:id,:_destroy, user_id: []],
        attachments: []
        )
    end



end
