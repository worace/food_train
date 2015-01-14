module AlexFactory
  def create_user(options = {})
    default_options = { full_name: "Jorghay" }
    User.create!(default_options.merge(options))
  end

  def create_group(options = {})
    default_options = { name: "Turing 1408" }
    Group.create!(default_options.merge(options))
  end
end
