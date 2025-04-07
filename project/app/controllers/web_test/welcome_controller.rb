class WebTest::WelcomeController < WebTestController
  before_action :define_dynamic
  before_action :get_all_dynamic, only: [:index]
  
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
    puts "****************------>>>>>>Parametros: #{parameters = take_and_treat_parameters}"
    error_name_exist?(model, parameters)
    puts "#{@erro}"
    if @erro.present?
      redirect_to web_test_welcome_create_path
    else
      create_dynamic_database(parameters)
      redirect_to web_test_welcome_create_path
    end
  end

  def aleatory_din
    redirect_to web_test_welcome_path
  end

  private
  
  def model
    return WebTest::Dynamic
  end

  def define_dynamic
    @dynamic = model.new
  end

  def get_all_dynamic
    @dynamics = model.all
  end

  def error_name_exist?(model, parameters)
    if model.where(name: parameters[:name]).present?
      insert_error("Nome: #{parameters[:name]} já existe")
    end
  end

  def create_dynamic_database(parameters)
    model.create_dynamic(parameters)
  end

  def params_dynamic
    params.require(:web_test_dynamic).permit(
      :name,
      :description,
      :review,
      :comment
    )
  end

  def take_and_treat_parameters
    name = params_dynamic["name"]
    description = params_dynamic["description"]
    review = params_dynamic["review"]
    comment = params_dynamic["comment"]

    @treat_array_parameters = {
      :name => verify_text_params(verify_field_present(name, 'name')),
      :description => verify_text_params(verify_field_present(description, 'description')),
      :review => verify_text_params(verify_field_present(review, 'review')),
      :comment => verify_text_params(verify_field_present(comment, 'comment'))
    }
  end
end
