YolosparoRb::Admin.controllers :model_texts do
  get :index do
    @title = "Model_texts"
    @model_texts = ModelText.all
    render 'model_texts/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'model_text')
    @model_text = ModelText.new
    render 'model_texts/new'
  end

  post :create do
    @model_text = ModelText.new(params[:model_text])
    if @model_text.save
      @title = pat(:create_title, :model => "model_text #{@model_text.id}")
      flash[:success] = pat(:create_success, :model => 'ModelText')
      params[:save_and_continue] ? redirect(url(:model_texts, :index)) : redirect(url(:model_texts, :edit, :id => @model_text.id))
    else
      @title = pat(:create_title, :model => 'model_text')
      flash.now[:error] = pat(:create_error, :model => 'model_text')
      render 'model_texts/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "model_text #{params[:id]}")
    @model_text = ModelText.find(params[:id])
    if @model_text
      render 'model_texts/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'model_text', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "model_text #{params[:id]}")
    @model_text = ModelText.find(params[:id])
    if @model_text
      if @model_text.update_attributes(params[:model_text])
        flash[:success] = pat(:update_success, :model => 'Model_text', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:model_texts, :index)) :
          redirect(url(:model_texts, :edit, :id => @model_text.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'model_text')
        render 'model_texts/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'model_text', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Model_texts"
    model_text = ModelText.find(params[:id])
    if model_text
      if model_text.destroy
        flash[:success] = pat(:delete_success, :model => 'Model_text', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'model_text')
      end
      redirect url(:model_texts, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'model_text', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Model_texts"
    unless params[:model_text_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'model_text')
      redirect(url(:model_texts, :index))
    end
    ids = params[:model_text_ids].split(',').map(&:strip)
    model_texts = ModelText.find(ids)
    
    if ModelText.destroy model_texts
    
      flash[:success] = pat(:destroy_many_success, :model => 'Model_texts', :ids => "#{ids.join(', ')}")
    end
    redirect url(:model_texts, :index)
  end
end
