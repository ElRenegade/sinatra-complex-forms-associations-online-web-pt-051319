class OwnersController < ApplicationController

  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index'
  end

  get '/owners/new' do
    @pets = Pet.all
    erb :'/owners/new'
  end

  post '/owners' do
    @owner = Owner.create(params[:owner])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
<<<<<<< HEAD
      # When using the shovel operator, ActiveRecord instantly fires update SQL
      # without waiting for the save or update call on the parent object,
      # unless the parent object is a new record.
    end
    redirect "/owners/#{@owner.id}"
=======
    end
      redirect "owners/#{@owner.id}"
>>>>>>> f95cd04434b62cffee5795de08bc32934f3a6360
  end

  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    @pets = Pet.all
    erb :'/owners/edit'
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  patch '/owners/:id' do
<<<<<<< HEAD
    @owner = Owner.find(params[:id])
    @owner.update(params[:owner])

    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end

    redirect "/owners/#{@owner.id}"
  end
=======
    if !params[:owner].keys.include?("pet_ids")
      params[:owner]["pet_ids"] = []
    end
    #######

    @owner = Owner.find(params[:id])
    @owner.update(params["owner"])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
      redirect "owners/#{@owner.id}"
    end
>>>>>>> f95cd04434b62cffee5795de08bc32934f3a6360
end
