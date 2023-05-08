class ApplicationController < ActionController::Base
  def helloblabla
    render html: 'Hello, salut'
  end
  
  def alta_ruta
    # render html: 'Ai intrat pe alta ruta!'
  end
    def index
    #o variabila fara @ este vizibila doar in functie
    #o variabila cu @este vizibila si in afara functiei
    @user=User.fisrt
    end
  end
end