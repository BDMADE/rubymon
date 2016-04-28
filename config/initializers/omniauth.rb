Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'1045978762135071','caf9df93b74e95b36483f1ba0f14b5a9',scope: 'email',info_fields: 'email,name'
end
