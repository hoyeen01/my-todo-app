class Api::TodolistsController < ApiController
    before_action :authenticate
    before_action :validate_params, only: [:create]

    def index
    end

    def create
        @todo_list = TodoList.new(params[:todo_list].permit!.merge(user_id: @user.id))
        if todo_list.errors.blank?
            return render json: {
                 message: 'Todo created successfully',
                 date: todo_list
                }, status: :created
            else
                return render json: {
                    message: todo_list.errors.full_messages.first || 'There was an error creating todo'
                }, status: :bad_request
            end
    end

    def update
    end

    def destroy
    end

    private
    
    def validate_params
        status = params.require(:status)
        
        if Todolist.statuses.keys.exclude?(status.downcase)
            return render json: { message: 'sttus should be either pending, done or cancelled'}
        end

        @todo_list_params = {
            status: status,
            name: params.require(:name)
        } 
    end

    def authenticate
        token = request.headers['Authorization']&.gsub('Bearer ', '')
        returb render json: { message: 'No token  in the header' }, status: :unauthorized if token.blank?

        user_data = TokenService.decode(token)
        @user - User.find(user_data.first['id'])
    end
end