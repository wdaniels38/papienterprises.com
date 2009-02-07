class PhotosController < ApplicationController
  def index
      @photos = Photo.paginate :page => params[:page], :conditions => {:parent_id => nil}
      
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @photos }
      end
    end
end
