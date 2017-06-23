require File.expand_path("../lib/websocket/connection/version", __FILE__)

Gem::Specification.new do |s|
  s.name              = 'websocket-connection'
  s.version           = WebSocket::Connection::VERSION
  s.summary           = 'WebSocket client without EventMachine'
  s.authors           = ["Jon Bracy"]
  s.email             = ["jonbracy@gmail.com"]
  s.homepage          = 'http://github.com/malomalo/websocket-connection'
  s.licenses          = ['MIT']

  s.extra_rdoc_files  = %w[README.md]
  s.rdoc_options      = %w[--main README.md --markup markdown]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w[lib]

  s.add_dependency 'websocket-driver', '>= 0.6.5'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest', '5.10.2'
  s.add_development_dependency 'minitest-reporters', '1.1.14'
end