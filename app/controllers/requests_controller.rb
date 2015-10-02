class RequestsController < ApplicationController
#    before_action :set_plugin, only: [:create]
    before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @plugin = Plugin.find(params[:plugin_id])
    @info_content = @plugin.info_content
    @request = Request.new(:plugin_id => @plugin.id, :user_id => 1)
  end

  # GET /requests/1/edit
  def edit
  end

  def get_parameters(plugin)
#    info_content = plugin.info_content
#    list_fields = []
 #   info_content['in'].each do |form_el|
 #     if form_el['id'] == 'format'
 #       list_fields.push(form_el['id'])
 #     elsif form_el['id'] == 'track'
 #       list_fields.push(form_el['id'] + '_bs_group')
 #         list_fields.push('field_' + form_el['type']) 
 #<% template_name = 'field_' + form_el['type'] %>
 #           <% template_name = 'field_track' if form_el['type'] == 'userfile' or form_el['type'] == 'txt' or form_el['type'] == 'file' %>
 #           <% template_name = 'field_format' if form_el['type'] == 'function'%>
 #           <% template_name += '_multiple' if form_el['multiple'] %>
 #           <% @var = form_el %>
 #           <%= render :partial => template_name %>
 #       <% end %>
    end

  # POST /requests
  # POST /requests.json
  def create
    #plugin = Plugin.find(params[:plugin_id])
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        #format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:user_id, :plugin_id, :parameters)
    end

end
