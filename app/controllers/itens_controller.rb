class ItensController < ApplicationController
  # GET /itens
  # GET /itens.xml
  def index
    @itens = Dispute.find(params[:dispute_id]).itens.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @itens }
    end
  end

  # GET /itens/1
  # GET /itens/1.xml
  def show
    @item = Dispute.find(params[:dispute_id]).itens.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /itens/new
  # GET /itens/new.xml
  def new
    @item = Dispute.find(params[:dispute_id]).itens.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /itens/1/edit
  def edit
    @item = Dispute.find(params[:dispute_id]).itens.find(params[:id])
  end

  # POST /itens
  # POST /itens.xml
  def create
    @item = Dispute.find(params[:dispute_id]).itens.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to(dispute_itens_path(params[:dispute_id]), :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /itens/1
  # PUT /itens/1.xml
  def update
    @item = Dispute.find(params[:dispute_id]).itens.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(dispute_itens_path(params[:dispute_id]), :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /itens/1
  # DELETE /itens/1.xml
  def destroy
    @item = Dispute.find(params[:dispute_id]).itens.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(dispute_itens_path(params[:dispute_id])) }
      format.xml  { head :ok }
    end
  end
end
