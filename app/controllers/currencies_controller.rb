class CurrenciesController < ApplicationController
  before_action :check_login
  # GET /currencies
  # GET /currencies.xml
  def index
    @currencies = Currency.all.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currencies }
    end
  end

  # GET /currencies/1
  # GET /currencies/1.xml
  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @currency }
    end
  end

  def collected_status
    @currency = Currency.find(params[:id])
    collected = nil
    if @currency.collected?
      collected = 'true'
    else
      collected = 'false'
    end
    render :xml => '<collected type="boolean">'+collected+'</collected>'
  end

  def collected_count
    render :json => Currency.coolected.count
  end

  def not_collected_count
    render :json => Currency.collected.count
  end
end