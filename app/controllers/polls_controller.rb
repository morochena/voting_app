class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy, :edit]

  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = current_user.polls.build(poll_params)

   # respond_to do |format|
      if @poll.save
        #format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        #format.json { render :show, status: :created, location: @poll }
        flash[:success] = "Poll was successfully created"
        redirect_to root_url
      else
        #format.html { render :new }
        #format.json { render json: @poll.errors, status: :unprocessable_entity }
        @feed_items = []
        render 'static_pages/home'
      end
    end
  #end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    #respond_to do |format|
     # format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      #format.json { head :no_content }
    #end
    flash[:success] = "Poll deleted"
    redirect_to request.referrer || root_url
  end

  def create_vote

    Vote.create(
      user_id: current_user.id,
      poll_id: params[:poll_id],
      option_num: params[:create_vote][:option]
      )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:title, :option1, :option2, :option3, :option4, :option5, :option6, :user_id, :picture,
      :option1_picture, :option2_picture, :option3_picture, :option4_picture, :option5_picture, :option6_picture)
    end

    def correct_user
      @poll = current_user.polls.find_by(id: params[:id])
      redirect_to root_url if @poll.nil?
    end
end
