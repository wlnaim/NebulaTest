class LoginController < ApplicationController
    

    def login
        @usuario = Usuario.new
    end

    def iniciar_sesion
        user = Usuario.find_by(email: params["usuario"]["email"].try(:authenticate, params["usuario"]["password"]))

        if user 
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user
            }
        else
            render json: {
                status: 401,
                email: params["usuario"]["email"],
                password: params["usuario"]["password"]
            }
        end
    end
end
