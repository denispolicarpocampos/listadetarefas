class TarefasController < ApplicationController
	
	before_filter :authenticate_user!

	def index
		@tarefas = current_user.tarefas.all.order(:data)
		@data = DateTime.now
	end

	def show
		@tarefa = Tarefa.find(params[:id])
	end
 
	def new
		@tarefa = Tarefa.new
		@data = DateTime.now.strftime("%Y%m%d%H%M") 
	end

	def edit
		@tarefa = current_user.tarefas.find_by(id: params[:id])
		@data = DateTime.now.strftime("%Y%m%d%H%M") 
	end

	def create
		@tarefa = current_user.tarefas.new(tarefa_params)
		if @tarefa.save
			redirect_to @tarefa
		else
			render 'new'
		end
	end

	def update
		@tarefa = current_user.tarefas.find_by(id: params[:id])
		if @tarefa.update(tarefa_params)
			redirect_to @tarefa
		else
			render 'edit'
		end

	end

	def destroy
		@tarefa = current_user.tarefas.find_by(id: params[:id])
		@tarefa.destroy
		redirect_to tarefas_path
	end

	def complete_index 
		@tarefas = current_user.tarefas.complete.order(:data)
	end

	def complete_update
		@tarefa = current_user.tarefas.find_by(id: params[:id])
		@tarefa.update(complete:true)
		@tarefa.update(data_complete:DateTime.now.strftime("%Y%m%d%H%M") )
	end

	def incomplete_task
		@tarefa = current_user.tarefas.find_by(id: params[:id])
		if @tarefa.update(data_tarefa_params)
			@tarefa.update(complete:false)
			redirect_to complete_index_tarefas_path
		end
	end

	def edit_complete_task
		@tarefa = current_user.tarefas.find_by(id: params[:id])
		@data = DateTime.now.strftime("%Y%m%d%H%M") 
		respond_to do |format|
    		format.html { redirect_to edit_complete_task }
    		format.js
    	end
	end
					
	private
	def tarefa_params
		params.require(:tarefa).permit(:titulo, :descricao, :data, :complete)
	end

	def data_tarefa_params
		params.require(:tarefa).permit(:data)
	end

end