class Admin::PhotosController < ApplicationController
  
  before_filter :authenticate
  
  def index
      @photos = Photo.find(:all, :conditions => {:parent_id => nil})

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @photos }
      end
    end

    def show
      @photo = Photo.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @photo }
      end
    end

    def new
      @photo = Photo.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @page }
      end
    end
    
    def test
      #@photos = Photo.find(:all)
      @photos = Photo.paginate :page => params[:page], :conditions => {:parent_id => nil}
    end

    def edit
      @photo = Photo.find(params[:id])
    end


    def create
      @photo = Photo.new(params[:photo])

      respond_to do |format|
        if @photo.save
          flash[:notice] = 'Photo was successfully created.'
          format.html { redirect_to([:admin, @photo]) }
          format.xml  { render :xml => @photo, :status => :created, :location => @photos }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
        end
      end
    end
    

    def update
      @photo = Photo.find(params[:id])

      respond_to do |format|
        if @photo.update_attributes(params[:photo])
          flash[:notice] = 'Photo was successfully updated.'
          format.html { redirect_to([:admin, @photo]) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @photo = Photo.find(params[:id])
      @photo.destroy

      respond_to do |format|
        format.html { redirect_to(admin_photos_url) }
        format.xml  { head :ok }
      end
    end
end
