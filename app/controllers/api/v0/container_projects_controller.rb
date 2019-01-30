module Api
  module V0
    class ContainerProjectsController < ApplicationController
      include Api::V0::Mixins::IndexMixin
      include Api::V0::Mixins::ShowMixin

      private

      def list_params
        params.permit(:source_id, :tenant_id)
      end
    end
  end
end
