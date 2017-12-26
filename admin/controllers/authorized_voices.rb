YolosparoRb::Admin.controllers :authorized_voices do
  get :index do
    @title = "Authorized_voices"
    @authorized_voices = AuthorizedVoice.all
    render 'authorized_voices/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'authorized_voices')
    @authorized_voices = AuthorizedVoice.new
    render 'authorized_voices/new'
  end

  post :create do
    @authorized_voices = AuthorizedVoice.new(params[:authorized_voices])
    if @authorized_voices.save
      @title = pat(:create_title, :model => "authorized_voices #{@authorized_voices.id}")
      flash[:success] = pat(:create_success, :model => 'AuthorizedVoice')
      params[:save_and_continue] ? redirect(url(:authorized_voices, :index)) : redirect(url(:authorized_voices, :edit, :id => @authorized_voices.id))
    else
      @title = pat(:create_title, :model => 'authorized_voices')
      flash.now[:error] = pat(:create_error, :model => 'authorized_voices')
      render 'authorized_voices/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "authorized_voices #{params[:id]}")
    @authorized_voices = AuthorizedVoice.find(params[:id])
    if @authorized_voices
      render 'authorized_voices/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'authorized_voices', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "authorized_voices #{params[:id]}")
    @authorized_voices = AuthorizedVoice.find(params[:id])
    if @authorized_voices
      if @authorized_voices.update_attributes(params[:authorized_voices])
        flash[:success] = pat(:update_success, :model => 'Authorized_voices', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:authorized_voices, :index)) :
          redirect(url(:authorized_voices, :edit, :id => @authorized_voices.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'authorized_voices')
        render 'authorized_voices/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'authorized_voices', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Authorized_voices"
    authorized_voices = AuthorizedVoice.find(params[:id])
    if authorized_voices
      if authorized_voices.destroy
        flash[:success] = pat(:delete_success, :model => 'Authorized_voices', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'authorized_voices')
      end
      redirect url(:authorized_voices, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'authorized_voices', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Authorized_voices"
    unless params[:authorized_voices_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'authorized_voices')
      redirect(url(:authorized_voices, :index))
    end
    ids = params[:authorized_voices_ids].split(',').map(&:strip)
    authorized_voices = AuthorizedVoice.find(ids)
    
    if AuthorizedVoice.destroy authorized_voices
    
      flash[:success] = pat(:destroy_many_success, :model => 'Authorized_voices', :ids => "#{ids.join(', ')}")
    end
    redirect url(:authorized_voices, :index)
  end
end
