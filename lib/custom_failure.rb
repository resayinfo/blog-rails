class CustomFailure < Devise::FailureApp

 def respond
   if request.content_type == 'application/json' || /application\/.*json/.match(request.format)
     json_failure
   else
     super
   end
 end

 def json_failure
   self.status = 401
   self.content_type = 'application/json'
   self.response_body = "{ \"message\" : \"#{i18n_message}\" }"
 end

end
