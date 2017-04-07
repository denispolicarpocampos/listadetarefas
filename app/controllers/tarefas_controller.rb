class TarefasController < ApplicationController
	
	before_filter :authenticate_user!

	def index
		@tarefa = Tarefa.all
	end

	def show
    	@tarefa = Tarefa.find(params[:id])
 	 end
 
  	def new
  		@tarefa = Tarefa.new
  	end

  	def edit
  		@tarefa = Tarefa.find(params[:id])
  	end

	def create
		 @tarefa = Tarefa.new(tarefa_params)
 		 if @tarefa.save
  			redirect_to @tarefa
  		 else
  		 	render 'new'
  		 end
	end

	def update
		@tarefa = Tarefa.find(params[:id])
		if @tarefa.update(tarefa_params)
			redirect_to @tarefa
		else
			render 'edit'
		end
	end

	def destroy
		@tarefa = Tarefa.find(params[:id])
		@tarefa.destroy

		redirect_to tarefas_path
 	end
 	
	private
	  def tarefa_params
	    params.require(:tarefa).permit(:titulo, :descricao, :data)
	  end
end
