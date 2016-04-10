class NodesController < ApplicationController
  before_action :set_node, only: [:show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token

  # GET /nodes
  # GET /nodes.json
  def index
    @nodes = Node.all
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node.to_json(:include => :addresses) }
    end
  end

  # GET /nodes/new
  def new
    @node = Node.new
    @node.addresses.build
    @node.properties.build
  end

  # GET /nodes/1/edit
  def edit
    @node.addresses.build
    @node.properties.build
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(node_params)

    respond_to do |format|
      if @node.save
        format.html { redirect_to edit_node_path(@node), notice: 'Node was successfully created.' }
        format.json { render :show, status: :created, location: @node }
      else
        format.html { render :new }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nodes/1
  # PATCH/PUT /nodes/1.json
  def update
    respond_to do |format|
      if @node.update(node_params)
        format.html { redirect_to edit_node_path, notice: 'Node was successfully updated.' }
        format.json { render json: @node,
          status: :ok,
          location: @node,
          :include => {:addresses => { except: [:created_at, :updated_at]}},
          :except => [:created_at, :updated_at]
        }
      else
        format.html { render :edit }
        format.json { render json: @node.errors, status: :unprocessable_entity,
          location: @node,
          :include => {:addresses => { except: [:created_at, :updated_at]}},
          :except => [:created_at, :updated_at]
        }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    @node.destroy
    respond_to do |format|
      format.html { redirect_to nodes_url, notice: 'Node was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_node
      @node = Node.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def node_params
      params.require(:node).permit(
      :hostname,
      :comments,
      :properties,
      :addresses_attributes => [:id, :address, :_destroy],
      :properties_attributes => [:id, :key, :value, :_destroy],
      )
    end
end
