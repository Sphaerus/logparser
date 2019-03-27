module Sorting
  class Collector
    def accept_resource(path:, ip_number:)
      resources[path] = new_resource unless resources[path]

      unless resources[path][:uniq_numbers].include?(ip_number)
        resources[path][:uniq_numbers] << ip_number
        resources[path][:uniq_count] += 1
      end
      resources[path][:count] += 1
      resources[path]
    end

    def resources
      @resources ||= {}
    end

    private

    def new_resource
      { count: 0, uniq_count: 0, uniq_numbers: [] }
    end
  end
end
