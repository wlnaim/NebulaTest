Rails.application.routes.draw do

  devise_for :users
  root to: "prestamos#index"
  
  get '/pago', to: 'pagos#index'
  get '/pago/show', to: 'pagos#show'
  get '/pago/new', to: 'pagos#new'
  get '/pago/:id/edit', to: 'pagos#edit', as: 'pago_edit'
  get '/pago/:id/prestamo', to: 'pagos#pago_prestamo', as: 'pago_prestamo'

  get '/prestamos', to: 'prestamos#index'
  get '/prestamos/:id/show', to: 'prestamos#show'
  get '/prestamos/new', to: 'prestamos#new'
  get '/prestamos/:id/edit', to: 'prestamos#edit', as: 'edit_prestamo'
  get 'prestamos/:id/dispersion', to: 'prestamos#dispersar_prestamo', as: 'dispersar_prestamo'
  get 'prestamos/:id/generar_dispersion', to: 'dispersions#generar_dispersion', as: 'generar_dispersion'
  delete '/prestamo/:id/', to: 'prestamos#destroy', as: 'delete_prestamo'
  post '/prestamos', to: 'prestamos#create'
 

  get '/dispersions', to: 'dispersions#index'
  get '/dispersions/:id/historial', to: 'dispersions#historial_dispersion', as: 'dispersions_historial'

  get '/usuarios/cuenta_bancaria', to: 'usuarios#cuenta_bancaria'
  patch 'usuarios/cuenta_bancaria', to: 'usuarios#update_cuenta_bancaria', as:'usuario_update_cuenta'

  get '/login', to: 'login#login'
  post 'login', to: 'login#iniciar_sesion'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
