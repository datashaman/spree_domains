class AbilityDecorator
    include CanCan::Ability

    def initialize(user)
        # cannot [ :admin, :index ], Spree::Property
    end
end
