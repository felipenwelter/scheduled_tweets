class Current < ActiveSupport::CurrentAttributes
    # it's a class used in our requests to assign things like user, account, timezone, etc
    # current.user will be the logged user account, separate from other user from other request
    attribute :user
end