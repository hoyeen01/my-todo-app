class TodoObjectsController < ApplicationController
    before_action :set_todo_list
    
    def create
       @todo_object = @todo_list.todo_objects.create(todo_object_params)
       redirect_to @todo_list
    end

    def destroy
        @todo_object = @todo_list.todo_objects.find(params[:id])
        if @todo_object.destroy
         flash[:success] = "Todo List object was deleted."
        else
         flash[:error] = "Todo List object could not be deleted."
        end
        redirect_to @todo_list 
    end
    private

    def set_todo_list
       @todo_list = TodoList.find(params[:todo_list_id])
    end

    def todo_object_params
       params[:todo_object].permit(:content)
    end
end
