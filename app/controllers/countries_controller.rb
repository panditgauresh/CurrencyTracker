class CountriesController < ApplicationController
  before_action :check_login
  helper_method :sort_column, :sort_direction
  # GET /countries
  # GET /countries.xml
  def index
    @countries = Country.all.paginate(page: params[:page], per_page: 10).order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.xml
  def show
    @country = Country.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @country }
    end
  end

  # GET /countries/1/edit
  def edit
    @country = Country.find(params[:id])
  end

  # POST /countries
  # POST /countries.xml
  def create
    @country = Country.new(params[:country].permit(:visited,:name,:code))

    respond_to do |format|
      if @country.save
        format.html { redirect_to(@country, :notice => 'Country was successfully created.') }
        format.xml  { render :xml => @country, :status => :created, :location => @country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.xml
  def update
    @country = Country.find(params[:id])

    respond_to do |format|
      if @country.update_attributes(params[:country].permit(:visited,:name,:code))
        format.html { redirect_to(@country, :notice => 'Country was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  def visit_status
    @country = Country.find(params[:id])
    visited = nil
    if @country.visited
      visited = 'true'
    else
      visited = 'false'
    end
    render :xml => '<visited type="boolean">'+visited+'</visited>'
  end


  def visited_count
    render :json => Country.visited.count
  end

  def not_visited_count
    render :json => Country.not_visited.count
  end

  private
  
  def sort_column
    Country.column_names.include?(params[:sort]) ? params[:sort] : "Name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
