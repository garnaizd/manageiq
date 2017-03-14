class Tariff < ApplicationRecord
  validates :variable_cost, :default => Money.new(0, 'EUR'),   :presence => true
  validates :fixed_cost,                                       :presence => true
  validates :title,                                            :presence => true
  validates :variable_cost_type_money, :fixed_cost_type_money, :on       => :create

  has_many :showback_rates, dependent: :destroy

  def variable_cost_type_money
    errors.add(:variable_cost, "Variable_cost must be instance of Money") unless :variable_cost.instance_of? Money
  end

  def fixed_cost_type_money
    errors.add(:fixed_cost, "Fixed_cost must be instance of Money") unless :fixed_cost.instance_of? Money
  end

  def self.seed
    seed_data.each do |con_tariff_attributes|
      title = con_tariff_attributes[:title]
      next if Tariff.find_by(:title => title)
      log_attrs = con_tariff_attributes.slice(:variable_cost, :fixed_cost, :title, :description)
      _log.info("Creating Tariff with parameters #{log_attrs.inspect}")
      _log.info("Creating #{title} Rate...")
      con_conf = create(con_tariff_attributes)
      con_conf.save
      _log.info("Creating #{title} consumption configuration... Complete")
    end
  end

  def self.seed_file_name
    @seed_file_name ||= Rails.root.join("db", "fixtures", "#{table_name}.yml")
  end
  private_class_method :seed_file_name

  def self.seed_data
    File.exist?(seed_file_name) ? YAML.load_file(seed_file_name) : []
  end
  private_class_method :seed_data
end
