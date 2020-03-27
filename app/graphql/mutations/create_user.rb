class Mutations::CreateUser < Mutations::BaseMutation
  #To create a user we need this arg(name and email)
  argument :name, String, required: true
  argument :email, String, required: true

  #The return portions - user field with errors
  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(name:, email:)
    user = User.new(name: name, email: email)
        if user.save
      {
        user: user,
        errors: []
      }
    else
      {
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end
end
