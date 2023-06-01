class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos or /todos.json
  def index
    @todos = current_user.todos
  end

  # ...
  
  def show
  end

  def edit
  end

  # GET /todos/new
  def new
    @todo = current_user.todos.build
  end

  # ...
  
  # POST /todos or /todos.json
  def create
    @todo = current_user.todos.build(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todo_url(@todo), notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # ...
  
  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todo_url(@todo), notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: "Musisz się zalogować, aby kontynuować."
    end
  end

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:nr, :termin, :nazwa, :tresc, :waznosc, :stopien_postepu)
  end
end
