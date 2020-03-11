module Api
  module V1
    module Mixins
      module IndexMixin
        def index
          raise_unless_primary_instance_exists
          render :json => Insights::API::Common::PaginatedResponse.new(
            :base_query => scoped(filtered.where(params_for_list)),
            :request    => request,
            :limit      => pagination_limit,
            :offset     => pagination_offset,
            :sort_by    => query_sort_by
          ).response
        end

        def scoped(relation)
          if through_relation_klass
            relation = relation.joins(through_relation_name)
          end

          relation
        end

        def raise_unless_primary_instance_exists
          return unless subcollection?

          primary_instance
        end
      end
    end
  end
end
