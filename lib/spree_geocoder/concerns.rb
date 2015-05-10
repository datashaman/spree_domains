require 'active_support/concern'

module OwnedController
    extend ActiveSupport::Concern
    
    included do
        before_action :check_owner, only: [ :show, :edit, :update, :destroy ]
        before_action :set_owner, only: [ :create, :update ]
    end

    def check_owner
        return if spree_current_user.has_spree_role?(:admin)

        if spree_current_user.has_spree_role?(:owner)
            unless @object.owner == spree_current_user
                flash[:error] = 'You are not the owner of the resource'
                redirect_to action: :index
            end
        end
    end

    def collection
        return super if spree_current_user.has_spree_role? :admin

        if spree_current_user.has_spree_role? :owner
            super.where :owner_id => spree_current_user.id
        else
            super
        end
    end

    def set_owner
        @object.owner = spree_current_user if spree_current_user.has_spree_role? :owner
    end
end

module OwnedModel
    extend ActiveSupport::Concern

    included do
        belongs_to :owner, :class_name => 'User'
    end
end
