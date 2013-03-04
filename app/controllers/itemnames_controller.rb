class ItemnamesController < ApplicationController
  # GET /itemnames
  # GET /itemnames.json
  def index
    @itemnames = Itemname.all
    @locations = Location.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itemnames }
    end
  end

  # GET /itemnames/1
  # GET /itemnames/1.json
  def show
    @itemname = Itemname.find(params[:id])
    @locations = Location.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itemname }
    end
  end

  # GET /itemnames/new
  # GET /itemnames/new.json
  def new
    @locations = Location.all
    @itemname = Itemname.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itemname }
    end
  end

  # GET /itemnames/1/edit
  def edit
    @locations = Location.all
    @itemname = Itemname.find(params[:id])
  end

  # POST /itemnames
  # POST /itemnames.json
  def create
    @locations = Location.all
    @itemname = Itemname.new(params[:itemname])

    respond_to do |format|
      if @itemname.save
        format.html { redirect_to @itemname, notice: 'Item creado.' }
        format.json { render json: @itemname, status: :created, location: @itemname }
      else
        format.html { render action: "new" }
        format.json { render json: @itemname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /itemnames/1
  # PUT /itemnames/1.json
  def update
    @itemname = Itemname.find(params[:id])

    respond_to do |format|
      if @itemname.update_attributes(params[:itemname])
        format.html { redirect_to @itemname, notice: 'Item actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itemname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itemnames/1
  # DELETE /itemnames/1.json
  def destroy
    @itemname = Itemname.find(params[:id])
    @itemname.destroy

    respond_to do |format|
      format.html { redirect_to itemnames_url }
      format.json { head :no_content }
    end
  end
end
