module YolosparoRb
  class App < Padrino::Application
    register SassInitializer
    use ConnectionPoolManagement
    register Padrino::Mailer
    register Padrino::Helpers
    enable :sessions

    layout  :layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)

    error 404 do
      redirect '/'
    end

    class YolosparoRb::App
      get '/' do
        @campaigns = Campaign.order(created_at: :desc)
        render 'campaigns/all'
      end

      # url is generated as '/campaign/:id'
      # url_for(:campaign, :id => 5) => "/campaign/5"
      # access params[:id]
      get :campaign, :with => :id do
        begin
          @campaign = Campaign.find params[:id]

          render 'campaigns/show'
        rescue ActiveRecord::RecordNotFound => e
          redirect '/'
        end
      end

      get '/timeline' do
        render 'timeline', layout: false, locals: {hashtag: params[:hashtag], widget_id: params[:widget_id]}
      end

      post '/sendmail' do
        mail_params = {}
        if params[:from].empty?
          mail_params[:from] = 'no-reply@yolosparo.org'
        else
          mail_params[:sender] = 'no-reply@yolosparo.org'
          if params[:nombre].empty?
            mail_params[:from] = "#{params[:nombre]} <#{params[:from]}>"
          else
            mail_params[:from] = params[:from]
          end
          mail_params[:cc] = mail_params[:from]
        end

        mail_params[:to] = Legi.all_emails
        mail_params[:"reply_to"] = mail_params[:to]
        mail_params[:subject] = params[:asunto]
        mail_params[:body] = params[:mensaje]

        # TODO averiguar si el metodo email de padrino es seguro o necesita q le sanitizen en input
        if mail_params[:subject].present? && mail_params[:body].present? && email(mail_params)
          status 200
          body({success: true, message: "Mensaje enviado :)"}.to_json)
        else
          status 400
          body({error: "No se pudo enviar el mail"}.to_json)
        end
      end
    end
  end
end
