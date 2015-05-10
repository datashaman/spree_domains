require 'active_support/concern'

module DomainedController
    extend ActiveSupport::Concern
    
    included do
        before_action :check_domain, only: [ :show, :edit, :update, :destroy ]
        before_action :set_domain, only: [ :create, :update ]
    end

    def check_domain
        unless @object.domain == current_domain.id
            flash[:error] = 'This is not the resource you\'re looking for'
            redirect_to action: :index
        end
    end

    def collection
        super.where :domain_id => current_domain.id
    end

    def set_domain
        @object.domain = current_domain
    end

    def current_domain
        domain_url = request.host_with_port
        Spree::Domain.find_by_url_and_enabled(domain_url, true)
    end
end

module DomainedModel
    extend ActiveSupport::Concern

    included do
        belongs_to :domain, :class_name => 'Spree::Domain'
    end
end
