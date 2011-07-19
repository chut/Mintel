class MinersController < ApplicationController
  # GET /miners
  # GET /miners.xml
  def index
    @miners = Miner.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @miners }
    end
  end

  # GET /miners/1
  # GET /miners/1.xml
  def show
    @miner = Miner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @miner }
    end
  end

  # GET /miners/new
  # GET /miners/new.xml
  def new
    @miner = Miner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @miner }
    end
  end

  # GET /miners/1/edit
  def edit
    @miner = Miner.find(params[:id])
  end

  # POST /miners
  # POST /miners.xml
  def create
    @miner = Miner.new(params[:miner])

    respond_to do |format|
      if @miner.save
        format.html { redirect_to(@miner, :notice => 'Miner was successfully created.') }
        format.xml  { render :xml => @miner, :status => :created, :location => @miner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @miner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /miners/1
  # PUT /miners/1.xml
  def update
    @miner = Miner.find(params[:id])

    respond_to do |format|
      if @miner.update_attributes(params[:miner])
        format.html { redirect_to(@miner, :notice => 'Miner was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @miner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /miners/1
  # DELETE /miners/1.xml
  def destroy
    @miner = Miner.find(params[:id])
    @miner.destroy

    respond_to do |format|
      format.html { redirect_to(miners_url) }
      format.xml  { head :ok }
    end
  end
end
