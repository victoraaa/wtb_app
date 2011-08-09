class DisputesController < ApplicationController

  def vote
    item1=Dispute.find(params[:dispute]).itens.find(params[:id1])
    item1.update_attributes({:rating => item1.rating+1})
    item2=Dispute.find(params[:dispute]).itens.find(params[:id2])
    item2.update_attributes({:rating => item2.rating-1})
    
    redirect_to :action => :show
  end


  # GET /disputes
  # GET /disputes.xml
  def index
    @disputes = Dispute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @disputes }
    end
  end

  # GET /disputes/1
  # GET /disputes/1.xml
  def show
    @dispute = Dispute.find(params[:id])
    @itens_for_battle = @dispute.itens.sort_by {rand}[0..1]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dispute }
    end
  end

  # GET /disputes/new
  # GET /disputes/new.xml
  def new
    @dispute = Dispute.new
    2.times {@dispute.itens.build}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dispute }
    end
  end

  # GET /disputes/1/edit
  def edit
    @dispute = Dispute.find(params[:id])
  end

  # POST /disputes
  # POST /disputes.xml
  def create
    @dispute = Dispute.new(params[:dispute])

    respond_to do |format|
      if @dispute.save
        format.html { redirect_to(@dispute, :notice => 'Dispute was successfully created.') }
        format.xml  { render :xml => @dispute, :status => :created, :location => @dispute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dispute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /disputes/1
  # PUT /disputes/1.xml
  def update
    @dispute = Dispute.find(params[:id])

    respond_to do |format|
      if @dispute.update_attributes(params[:dispute])
        format.html { redirect_to(@dispute, :notice => 'Dispute was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dispute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /disputes/1
  # DELETE /disputes/1.xml
  def destroy
    @dispute = Dispute.find(params[:id])
    @dispute.destroy

    respond_to do |format|
      format.html { redirect_to(disputes_url) }
      format.xml  { head :ok }
    end
  end
end
