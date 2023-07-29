class Api::V1::UsersController < ApplicationController

    def index
        users = User.includes(:hobbies) 
        hobbies = Hobby.distinct.pluck(:name)
        hobby_user_count = hobbies.map do |hobby|
                           { hobby_name: hobby,
                            user_count: User.joins(:hobbies).where(hobbies: { name: hobby }).count}
                        end
        render json: {users: users.as_json(include: :hobbies) , hobbies: hobby_user_count}  
    end

    def show 
        users = User.find_by(id: params[:id])

        if user
            render json: users, status:success
        else
            render json: "Couldn't find the user"
        end
    end


end
