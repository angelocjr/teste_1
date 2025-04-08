class WebTest::WelcomeController < WebTestController
  before_action :define_dynamic
  before_action :define_dynamic_by_params, only: [:delete, :delete_dynamic, :update, :update_dynamic]
  before_action :get_all_dynamic, only: [:index]
  before_action :aleatory_dynamic, only: [:aleatory_din]
  
  def initialize
    super
  end
  
  def index
  end

  def create
  end

  def update
  end

  def delete
  end

  def create_dynamic 
    parameters = take_and_treat_parameters
    error_name_exist?(parameters)
    
    if @erro.present?
      redirect_to web_test_welcome_path, notice: @erro
    else
      create_dynamic_database(parameters)
      dynamic = find_dynamic_by_name(parameters[:name])
      create_review_database(dynamic, parameters)
      redirect_to web_test_welcome_path, notice: 'Criado com sucesso!!!'
    end
  end

  def update_dynamic
    parameters = take_and_treat_parameters
    error_name_dont_exist?(parameters)

    if @erro.present?
      redirect_to web_test_welcome_path, notice: @erro
    else
      dynamic = find_dynamic_by_name(parameters[:name])
      update_dynamic_database(dynamic, parameters)
      create_review_database(dynamic, parameters)
      redirect_to web_test_welcome_path, notice: 'Atualizado com sucesso!!!'
    end
  end

  def delete_dynamic
    delete_all_reviews
    delete_dynamic_database
    redirect_to web_test_welcome_path, notice: 'Excluido com sucesso!!!'
  end

  def aleatory_din
    redirect_to web_test_welcome_path(@dynamic)
  end

  private
  
  def cont_dynamic
    return WebTest::DynamicController.new
  end

  def cont_review
    return WebTest::ReviewController.new
  end

  def define_dynamic
    @dynamic = cont_dynamic.define_dynamic
  end

  def define_dynamic_by_id(id)
    return cont_dynamic.define_dynamic_by_id(id)
  end

  def define_dynamic_by_params
    @dynamic = cont_dynamic.define_dynamic_by_id(params[:format])
  end

  def get_all_dynamic
    if params[:format].present?
      @dynamics = [define_dynamic_by_id(params[:format])]
    else
      @dynamics = cont_dynamic.get_all_dynamic
    end
  end

  def aleatory_dynamic
    @dynamic = cont_dynamic.aleatory_dynamic
  end

  def find_dynamic_by_name(name)
    return cont_dynamic.find_dynamic_by_name(name)
  end

  def error_name_exist?(parameters)
    if cont_dynamic.exist_dynamic_by_name(parameters[:name])
      insert_error("Nome: #{parameters[:name]} já existe")
    end
  end

  def error_name_dont_exist?(parameters)
    unless cont_dynamic.exist_dynamic_by_name(parameters[:name])
      insert_error("Nome: #{parameters[:name]} não existe")
    end
  end

  def create_dynamic_database(parameters)
    cont_dynamic.create_dynamic_database(parameters)
  end

  def update_dynamic_database(dynamic, parameters)
    cont_dynamic.update_dynamic_database(dynamic, parameters)
  end

  def delete_dynamic_database
    cont_dynamic.delete_dynamic_database(@dynamic)
  end

  def create_review_database(dynamic, parameters)
    cont_review.create_review_database(dynamic, parameters)
  end

  def delete_all_reviews
    @dynamic.reviews.each do |review|
      cont_review.delete_review_database(review)
    end
  end

  def params_dynamic
    params.require(:web_test_dynamic).permit(
      :name,
      :description,
      :note,
      :comment
    )
  end

  def take_and_treat_parameters
    name = params_dynamic["name"]
    description = params_dynamic["description"]
    note = params_dynamic["note"]
    comment = params_dynamic["comment"]

    @treat_array_parameters = {
      :name => verify_text_params(verify_field_present(name, 'name')),
      :description => verify_text_params(verify_field_present(description, 'description')),
      :note => verify_field_present(note, 'note'),
      :comment => verify_text_params(verify_field_present(comment, 'comment'))
    }
  end
end
