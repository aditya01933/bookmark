class BookmarkManagersController < ApplicationController
  before_action :set_bookmark_manager, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /bookmark_managers
  # GET /bookmark_managers.json
  def index
    if params[:tag] 
      @bookmark_managers = BookmarkManager.tagged_with(params[:tag])
    elsif params[:search]
      @bookmark_managers = BookmarkManager.tagged_with(params[:search])
    else  
      @bookmark_managers = BookmarkManager.all
    end  
  end

  # GET /bookmark_managers/1
  # GET /bookmark_managers/1.json
  def show
  end

  # GET /bookmark_managers/new
  def new
    @bookmark_manager = BookmarkManager.new
  end

  # GET /bookmark_managers/1/edit
  def edit
  end

  # POST /bookmark_managers
  # POST /bookmark_managers.json
  def create
    @bookmark_manager = BookmarkManager.new(bookmark_manager_params)

    respond_to do |format|
      if @bookmark_manager.save
        format.html { redirect_to @bookmark_manager, notice: 'Bookmark manager was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark_manager }
      else
        format.html { render :new }
        format.json { render json: @bookmark_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmark_managers/1
  # PATCH/PUT /bookmark_managers/1.json
  def update
    respond_to do |format|
      if @bookmark_manager.update(bookmark_manager_params)
        format.html { redirect_to @bookmark_manager, notice: 'Bookmark manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark_manager }
      else
        format.html { render :edit }
        format.json { render json: @bookmark_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmark_managers/1
  # DELETE /bookmark_managers/1.json
  def destroy
    @bookmark_manager.destroy
    respond_to do |format|
      format.html { redirect_to bookmark_managers_url, notice: 'Bookmark manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark_manager
      @bookmark_manager = BookmarkManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_manager_params
      params.require(:bookmark_manager).permit(:name, :tag_list)
    end
end
