class Tarife < ApplicationRecord
  validates :id_tarife,     :uniqueness => true,             :presence => true
  validates :variable_cost, :default => Money.new(0, 'EUR'), :presence => true
  validates :fixed_cost,                                     :presence => true
  validates :array_rates,                                    :presence => true
  validates :title,                                          :presence => true

  def self.seed
    seed_data.each do |con_tarife_attributtes|
      id_tarife = con_tarife_attributtes[:id_tarife]
      next if Tarife.find_by(:id_tarife => id_tarife)
      log_attrs = con_tarife_attributtes.slice(:id_tarife, :variable_cost, :fixed_cost, :array_rates, :title, :description)
      _log.info("Creating Tarife with parameters #{log_attrs.inspect}")
      _log.info("Creating #{id_tarife} Rate...")
      con_conf = create(con_tarife_attributtes)
      con_conf.save
      _log.info("Creating #{id_tarife} consumption configuration... Complete")
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
