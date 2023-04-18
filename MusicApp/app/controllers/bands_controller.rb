class BandsController < ApplicationController
    before_action(:set_band, only: [:show, :edit, :update, :destroy])

    def index
        @bands = Band.all
        render :index
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            flash.now[:messages] = ["Band Successfully Created"]
            render :show
        else
            flash.now[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def new
        @band = Band.new
        render :new
    end

    def edit
        render :edit
    end

    def show
        render :show
    end

    def update
        if @band.save
            flash.now[:messages] = ["Band Successfully Edited"]
            render :show
        else
            flash.now[:errors] = @band.errors.full_messages
            render :edit
        end
    end

    def destroy
        @band.destroy
        render :index
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end

    def set_band
        @band = Band.find_by(id: params[:id])
    end

end
