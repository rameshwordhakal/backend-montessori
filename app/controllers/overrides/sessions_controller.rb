module Overrides
      class SessionsController < DeviseTokenAuth::SessionsController
        def render_create_success
            # render json: {status: "hello"}
            
            render json: UserSerializer.new(@resource)
        end
      end
    end