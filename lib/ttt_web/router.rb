module TttWeb

  class Router
    attr_reader :routes

    def initialize
      @routes = {}
    end

    def add_route(path, method, &block)
      routes[{:path => path,
              :method => method.to_s}] = {:block => block}
    end

    def match(env)
      route = routes[{:path => env["PATH_INFO"],
                      :method => env["REQUEST_METHOD"]}]
      if route
        [200, {}, [route[:block].call(env)]]
      else
        [404, {}, []]
      end
    end

  end
end
