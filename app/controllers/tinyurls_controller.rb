class TinyurlsController < ApplicationController
  before_action :set_tinyurl, only: [:show, :edit, :update, :destroy]

  # GET /tinyurls
  # GET /tinyurls.json
  def index
    @tinyurls = Tinyurl.all
  end

  # GET /tinyurls/1
  # GET /tinyurls/1.json
  def show
  end

  # GET /tinyurls/new
  def new
    # Call library to generate random strings
    require 'securerandom'
    @tinyurl = Tinyurl.new
    # Prepopulate the random string
    @tinyurl.tiny_url = "http://#{request.host}:#{request.port}/" + SecureRandom.urlsafe_base64(5)
  end

  # GET /tinyurls/1/edit
  def edit
  end

  # POST /tinyurls
  # POST /tinyurls.json
  def create
    @tinyurl = Tinyurl.new(tinyurl_params)

    respond_to do |format|
      if @tinyurl.save
        format.html { redirect_to @tinyurl, notice: 'Tinyurl was successfully created.' }
        format.json { render :show, status: :created, location: @tinyurl }
      else
        format.html { render :new }
        format.json { render json: @tinyurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tinyurls/1
  # PATCH/PUT /tinyurls/1.json
  def update
    respond_to do |format|
      if @tinyurl.update(tinyurl_params)
        format.html { redirect_to @tinyurl, notice: 'Tinyurl was successfully updated.' }
        format.json { render :show, status: :ok, location: @tinyurl }
      else
        format.html { render :edit }
        format.json { render json: @tinyurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tinyurls/1
  # DELETE /tinyurls/1.json
  def destroy
    @tinyurl.destroy
    respond_to do |format|
      format.html { redirect_to tinyurls_url, notice: 'Tinyurl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tinyurl
      @tinyurl = Tinyurl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tinyurl_params
      params.require(:tinyurl).permit(:original_url, :tiny_url, :expiration)
    end
end
