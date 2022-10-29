class TodoList < ApplicationRecord
    has_many :todo_objects
    enum status: {
        pending: 0,
        done: 1,
        cancelled: 2
    }
end
