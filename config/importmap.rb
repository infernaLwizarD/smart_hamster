# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
# pin "jquery", to: "jquery3.min.js", preload: true
pin "jquery", to: "jquery-3.6.0.min.js", preload: true
pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "popper", to: "popper.js", preload: true
pin "adminlte", to: "adminlte.js", preload: true