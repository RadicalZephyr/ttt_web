#\ -s RackJax -p 5050

require 'rack'
require 'rack_jax'
require 'ttt_web'

use Rack::Session::Pool,
    :expire_after => 1800
use Rack::Static, :urls => ["/js", "/css", "/images"], :root => "public"
run TttWeb::RackShell.new_shell
