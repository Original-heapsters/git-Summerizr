require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'octokit'

class Summerizr

    def login_client
        
        #Provide authentication credentials
        Octokit.configure do |c|
            c.login = 'sellnat77'
            c.password = 'teleport77'
        end

        # Fetch the current user
        curr_user = Octokit.user
        
        puts 'before'
        curr_user.fields.each do |name,val, unknown|
            info = "#{name} :: #{val} :: #{unknown}"
            puts info
        end
        puts 'after'
    end
end

test1 = Summerizr.new

test1.login_client