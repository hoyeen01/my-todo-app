class TodoListsController < ApplicationController
  before_action :requires_sign_in
  before_action :set_todo_list, only: %i[ show edit update destroy ]

  # GET /todo_lists or /todo_lists.json
  def index
    @todo_lists = @user.todo_lists.order(created_at: :desc)
  end

  # GET /todo_lists/1 or /todo_lists/1.json
  def show
  end

  # GET /todo_lists/new
  def new
    @todo_list = TodoList.new
  end

  # GET /todo_lists/1/edit
  def edit
  end

  # POST /todo_lists or /todo_lists.json
  def create
    @todo_list = TodoList.new(params[:todo_list].permit!.merge(user_id: @user.id))

    if @todo_list.save
      redirect_to todo_lists_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /todo_lists/1 or /todo_lists/1.json
  def update
    TodoList.find(params[:id]).update(params[:todo_list].permit!)
    redirect_to todo_list_path
  end

  # DELETE /todo_lists/1 or /todo_lists/1.json
  def destroy
    @todo_list.destroy
    redirect_to todo_list_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
end
