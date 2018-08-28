class PlacesController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]

    # GET /Establecimiento
    def index
      @places = Place.all
      json_response(@places)
    end
  
    # POST /Establecimiento
    def create
      cat = Category.find(params[:category])
      new_params = todo_params
      new_params["category"] = cat

      @places = Place.create!(new_params)
      json_response(@places, :created)
    end
  
    # GET /establecimientos/:id
    def show
      json_response(@places)
    end
  
    # PUT /todos/:id
    def update
      @places.update(todo_params)
      head :no_content
    end
  
    # DELETE /todos/:id
    def destroy
      @places.destroy
      head :no_content
    end
  
    private
  
    def todo_params
      # whitelist params
      params.permit(:nombre, :direccion, :localidad, :ciudad, :telefono, :latitud, :longitud,
      :horario, :estado, :web, :category)
    end
  
    def set_todo
      @places = Place.find(params[:id])
    end
end
