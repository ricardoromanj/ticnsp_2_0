class VisitorMessagesController < WebApplicationController
  before_action :set_visitor_message, only: [:show, :edit, :update, :destroy, :mark_as_replied, :unmark_as_replied]

  # GET /visitor_messages
  # GET /visitor_messages.json
  def index
    # @visitor_messages = VisitorMessage.all
    respond_to do |format|
      format.html
      format.json { render json: VisitorMessageDatatable.new(view_context) }
    end
  end

  # GET /visitor_messages/1
  # GET /visitor_messages/1.json
  def show
  end

  # PUT /visitor_messages/1/mark_as_replied
  def mark_as_replied
    @visitor_message.replied_at = Time.now
    @visitor_message.save
    redirect_to visitor_messages_url, notice: 'Mensaje marcado como respondido'
  end

  # PUT /visitor_messages/1/unmark_as_replied
  def unmark_as_replied
    @visitor_message.replied_at = nil
    @visitor_message.save
    redirect_to visitor_messages_url, notice: 'Mensaje marcado como no atendido'
  end

  # GET /visitor_messages/new
  def new
    @visitor_message = VisitorMessage.new
  end

  # GET /visitor_messages/1/edit
  def edit
  end

  # POST /visitor_messages
  # POST /visitor_messages.json
  def create
    @visitor_message = VisitorMessage.new(visitor_message_params)

    respond_to do |format|
      if @visitor_message.save
        format.html { redirect_to @visitor_message, notice: 'Visitor message was successfully created.' }
        format.json { render :show, status: :created, location: @visitor_message }
      else
        format.html { render :new }
        format.json { render json: @visitor_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitor_messages/1
  # PATCH/PUT /visitor_messages/1.json
  def update
    respond_to do |format|
      if @visitor_message.update(visitor_message_params)
        format.html { redirect_to @visitor_message, notice: 'Visitor message was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitor_message }
      else
        format.html { render :edit }
        format.json { render json: @visitor_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitor_messages/1
  # DELETE /visitor_messages/1.json
  def destroy
    @visitor_message.destroy
    respond_to do |format|
      format.html { redirect_to visitor_messages_url, notice: 'Visitor message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor_message
      @visitor_message = VisitorMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_message_params
      params.require(:visitor_message).permit(:name, :email, :message_text, :read, :read_at, :replied, :replied_at, :replied_by_user_id)
    end
end
