class PicsController < ApplicationController
  before_action :set_pic, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pics
  def index
    if params[:tag]
      @pics = Pic.tagged_with(params[:tag])
    else
      @pics = current_user.pics.order "created_at DESC"
    end
  end

  # GET /pics/1
  def show
  end

  # GET /pics/new
  def new
    @pic = current_user.pics.build
  end

  # GET /pics/1/edit
  def edit
  end

  # POST /pics
  def create
    @pic = current_user.pics.build(pic_params)

    respond_to do |format|
      if @pic.save
        format.html { redirect_to @pic, notice: 'Pic was successfully created.' }
        format.json { render :show, status: :created, location: @pic }
      else
        format.html { render :new }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pics/1
  def update
    respond_to do |format|
      if @pic.update(pic_params)
        format.html { redirect_to @pic, notice: 'Pic was successfully updated.' }
        format.json { render :show, status: :ok, location: @pic }
      else
        format.html { render :edit }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pics/1
  def destroy
    @pic.destroy
    respond_to do |format|
      format.html { redirect_to pics_url, notice: 'Pic was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    def correct_user
      @pic = current_user.pics.find_by(id: params[:id])
      redirect_to pics_path, notice: "You can't edit this pic" if @pic.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pic_params
      params.require(:pic).permit(:tag_list, :image)
    end
end
