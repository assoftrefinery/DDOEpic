#noinspection ALL
class ItemsController < ApplicationController
  #ver esto requiere estar logueado
  before_filter :login_required
  # GET /items
  # GET /items.json
  def index
    #@items = Item.all
    @locations = Location.all
    @itemnames = Itemname.all
    #variable global que tiene el ID del usuario que esta logueado.. PROBAR CON MAS DE UN USER A LA VEZ
    id_usuario = current_user.id
    #flash.now[:alert] = id_usuario
    @items = Item.find_by_sql("SELECT * FROM items WHERE items.user_id = #{id_usuario}")
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @itemnames = Itemname.all
    @item = Item.find(params[:id])
    @locnames = Location.find_by_sql("SELECT locations.nombre FROM locations")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
   # @locations = Location.all
   # @itemnames = Itemname.all
   # @locnames = Location.find_by_sql("SELECT locations.nombre FROM locations")
    #mensaje debug
    #flash.now[:alert] = @item.nombre
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

    # ---------------------------------------------------------------------------------------------------------------
  #aqui rellenamos @itemnames solo con los que corresponden a lo que se ha seleccionado en el desplegable de packs
  def dynamic_districts
    @itemnames = Itemname.find_all_by_location_id(params[:id])
    respond_to do |format|
      format.js
    end
  end

    # ---------------------------------------------------------------------------------------------------------------

  # GET /items/1/edit
  def edit
    @itemnames = Itemname.all
    @locations = Location.all
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @item.user_id = current_user.id

    #lo de abajo funciona pero el string es [#<Itemname nombre: "Cloak of the Zephyr">]
    #@item.nombre = Itemname.find_by_sql("SELECT nombre FROM itemnames WHERE id = #{@item.itemname_id}")

    #Esto es lo que buscaba, coño
    @item.nombre = Itemname.find(@item.itemname_id).nombre

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Tu nuevo item se ha incorporado a la lista.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])
    @itemnames = Itemname.all
    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item actualizado con exito.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
  #==================================================================================================================
  def show_completos
    id_usuario = current_user.id
    id_location = 1#Location.find(Item.location_id).nombre
    @items = Item.find_by_sql("SELECT * FROM items WHERE items.user_id = #{id_usuario} AND items.base = 't' AND items.seal = 't' AND items.shard = 't' AND items.scroll = 't'")
    #@hola = @items.count
      respond_to do |format|
      format.html #{ redirect_to items_url }
      format.json { render json: @items }
    end
  end
  #==================================================================================================================
  #Seguro que se puede hacer mejor
  #enseñar solo items de Chronoscope (ID =1)               ----------------------------------------------------------
  def show_chrono
    id_usuario = current_user.id
    id_location = 1#Location.find(Item.location_id).nombre
    @items = Item.find_by_sql("SELECT * FROM items WHERE items.user_id = #{id_usuario} AND items.location_id= #{id_location}")

    respond_to do |format|
      format.html #{ redirect_to items_url }
      format.json { render json: @items }
    end
  end
  #enseñar solo items de Chronoscope (ID =2)             ----------------------------------------------------------
  def show_carnival
    id_usuario = current_user.id
    id_location = 2#Location.find(Item.location_id).nombre
    @items = Item.find_by_sql("SELECT * FROM items WHERE items.user_id = #{id_usuario} AND items.location_id= #{id_location}")

    respond_to do |format|
      format.html #{ redirect_to items_url }
      format.json { render json: @items }
    end
  end
  #enseñar solo items de Sands (ID =3)             ----------------------------------------------------------
  def show_sands
    id_usuario = current_user.id
    id_location = 3#Location.find(Item.location_id).nombre
    @items = Item.find_by_sql("SELECT * FROM items WHERE items.user_id = #{id_usuario} AND items.location_id= #{id_location}")

    respond_to do |format|
      format.html #{ redirect_to items_url }
      format.json { render json: @items }
    end
   end
   #enseñar solo items de Sentinels (ID =4)             ----------------------------------------------------------
    def show_sentinels
      id_usuario = current_user.id
      id_location = 4#Location.find(Item.location_id).nombre
      @items = Item.find_by_sql("SELECT * FROM items WHERE items.user_id = #{id_usuario} AND items.location_id= #{id_location}")

      respond_to do |format|
        format.html #{ redirect_to items_url }
        format.json { render json: @items }
      end
    end
   #enseñar solo items de RedFens (ID =5)             ----------------------------------------------------------
    def show_redfens
      id_usuario = current_user.id
      id_location = 5#Location.find(Item.location_id).nombre
      @items = Item.find_by_sql("SELECT * FROM items WHERE items.user_id = #{id_usuario} AND items.location_id= #{id_location}")

      respond_to do |format|
        format.html #{ redirect_to items_url }
        format.json { render json: @items }
      end
    end
  #enseñar solo items de VoN (ID =6)             ----------------------------------------------------------
  def show_von
    id_usuario = current_user.id
    id_location = 6#Location.find(Item.location_id).nombre
    @items = Item.find_by_sql("SELECT * FROM items WHERE items.user_id = #{id_usuario} AND items.location_id= #{id_location}")

    respond_to do |format|
      format.html #{ redirect_to items_url }
      format.json { render json: @items }
    end
  end
  #enseñar solo items de WebOfChaos (lords,senvants,spinner) (ID =7)             ----------------------------------------------------------
  def show_web
    id_usuario = current_user.id
    id_location = 7#Location.find(Item.location_id).nombre
    @items = Item.find_by_sql("SELECT * FROM items WHERE items.user_id = #{id_usuario} AND items.location_id= #{id_location}")

    respond_to do |format|
      format.html #{ redirect_to items_url }
      format.json { render json: @items }
    end
  end

end