class DocsController < ApplicationController
  before_action :set_doc, only: [:destroy]
  def new
  	if current_user==nil
      redirect_to '/home'    
    end
  	@doc=Document.new
  end

  def show
  	if current_user==nil
      redirect_to '/home'    
    end
    @doc=Document.where("user_id=#{session[:user_id].to_i}")
  end

  def create
  	if current_user==nil
      redirect_to '/home'    
    end
    @doc = Document.new(doc_params)
    respond_to do |format|
      if @doc.save
        format.html { redirect_to docs_path }
      else
        format.html { render :new }
      end
    end
  end
  def destroy
    if current_user==nil
      redirect_to '/home'    
    end    
    @doc.destroy
    respond_to do |format|
      format.html { redirect_to docs_path, notice: 'Удалено' }
    end
  end

private
  def set_doc
    @doc = Document.find((params[:id]).to_i) rescue nil?
    if @doc==false
      redirect_to  errors_path
    end
  end


 def doc_params
 	sgh=params.require(:document).permit(:name,:about,:type_system,:tegs,:largeabout,:listtodo,:authors)         	
    return {name:sgh[:name],about: sgh[:about],type_system: sgh[:type_system],tegs:sgh[:tegs],largeabout:sgh[:largeabout],listtodo:sgh[:listtodo],authors:sgh[:authors],user_id:session[:user_id]}
 end
end
